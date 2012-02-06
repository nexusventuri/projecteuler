require 'fileutils'
require 'pathname'

RED="\e[00;31m"
YELLOW="\e[00;33m"
GREEN="\e[00;32m"
WHITE="\e[01;37m"
LIGHT_BLUE="\e[01;34m"

class BuildResult
  attr_reader :output, :shell_result, :basedir, :project, :execution_time
  def initialize(project, output, shell_result, execution_time)
    @output, @shell_result = output, shell_result
    @project = project
    @execution_time = execution_time
  end

  def success?
    @shell_result == 0
  end

  def has_solution?
    !@output[/\* And the solution is\.\.\.\./].nil?
  end

  def name
    @project.name
  end

  def pretty_print_result
    puts RED
    puts GREEN if $? == 0

    puts @output

    puts WHITE
    $? == 0
  end
end

class Project
  attr_reader :path

  def self.all_projects
    Dir['**/spec'].map{|dir| Project.new(File.expand_path(dir + "/.."))}
  end

  def self.most_recent
    all_projects.sort{|a,b| a.last_access <=> b.last_access}.last
  end

  def self.slow_projects
    all_projects.select{|project| project.slow?}
  end

  def last_access
    @path.mtime
  end

  def initialize(directory)
    @path = Pathname.new(directory)
  end

  def slow?
    @path.join("slow").file?
  end
  
  def problem?
    !problem_number.nil?
  end

  def mark_as_fast
    changed = slow?
    @path.join("slow").delete if slow?
    changed
  end

  def problem_number
    @path.to_s[/\d+$/]
  end

  def name
    @path.basename
  end

  def mark_as_slow
    changed = !slow?
    FileUtils.touch @path.join("slow")
    changed
  end

  def execute_tests
    spec_dir = @path.join("spec")
    lib_dir = @path.join("lib")
    if spec_dir.directory?
      print_result_header

      output = nil
      time = Benchmark.measure {output = `rspec #{spec_dir} -I #{lib_dir}`}

      result = BuildResult.new(self, output, $?, time)
      result.pretty_print_result
      set_execution_speed time
      print_result_separator
    end
    result
  end

  def print_result_header
    speed = slow? ? "(slow)" : "(fast)"
    puts ""
    puts "Executing tests in #{@path} #{speed}"
  end

  def print_result_separator()
    puts WHITE
    puts ""
    puts "----------------------------------"
    puts ""
  end

  def set_execution_speed(time)
      if time.total > 3
        changed = mark_as_slow
        if changed
          puts RED
          puts "problem #{problem_number} is now marked as slow :(" if changed
        end
      else
        changed = mark_as_fast
        if changed
          puts LIGHT_BLUE
          puts "problem #{problem_number} is now marked as fast!!!" 
        end
      end
  end
end
