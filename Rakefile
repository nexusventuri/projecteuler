include FileUtils
require 'pathname'

RED="\e[00;31m"
YELLOW="\e[00;33m"
GREEN="\e[00;32m"
WHITE="\e[01;37m"
LIGHT_BLUE="\e[01;34m"

common_lib = "common/lib"

desc "Runs all tests"
task :run_all do
  get_spec_dirs.each do |dir|
    execute_tests_in(dir)
  end
end

desc "Runs latest modified directory"
task :latest do
  most_recent_project = get_spec_dirs.sort{|a,b| File.mtime(a) <=> File.mtime(b)}.last
  execute_tests_in(most_recent_project)
end

desc "Runs a specific test"
task :run, :problem_id do |t, args|
  execute_tests_in(args.problem_id)
end

desc "Runs all the tests in the common folder(a library that might be virtually be shared by any problem)"
task :pre_commit do
  execute_tests_in("common")
end

desc "By default runs last problem and the tests from the common folder"
task :default => [:pre_commit, :latest] do 
end

desc "Creates a blank project with a problem{problem_id}.rb file and a problem{problem_id}_spec.rb file, the spec pointing to the problem and the problem pointing to the base directory for the common library"
task :create, :problem_id do |t, args|
  problem_id = args.problem_id
  lib="#{problem_id}/lib"
  spec="#{problem_id}/spec"
  mkdir_p lib
  mkdir_p spec

  File.open("#{lib}/problem#{problem_id}.rb", "w") do |file| 
    file.write problem_template(problem_id)
  end

  File.open("#{spec}/problem#{problem_id}_spec.rb", "w") do |file|
    file.write spec_template(problem_id)
  end
end

def spec_template(problem_id)
"""
require 'problem#{problem_id}'
require 'solution_printer'

describe Problem#{problem_id} do
  it \"I_represent_an_empty_test\" do
  end

  xit \"Should solve the problem\" do
    result = print_solution{\"solveMe\"}
    result.should == 0
  end
end
"""
end

def problem_template(problem_id)
"""
$:.unshift File.expand_path(\"../../../common/lib/\", __FILE__)

class Problem#{problem_id}

end
"""
end

def get_spec_dirs
  Dir['**/spec'].map{|dir| File.expand_path(dir + "/..")}
end

def execute_tests_in(basedir)
  spec_dir = Pathname.new(basedir).join("spec")
  lib_dir = Pathname.new(basedir).join("lib")
  if spec_dir.directory?
    print_result_header basedir

    output=`rspec #{spec_dir} -I #{lib_dir}`
    pretty_print_result(output)

    print_result_footer
  end
end

def print_result_header(dir)
    puts ""
    puts "Executing tests in #{dir}"
end

def print_result_footer()
    puts ""
    puts "----------------------------------"
    puts ""
end

def pretty_print_result(output)
  puts RED
  puts GREEN if $? == 0

  puts output

  puts WHITE
end
