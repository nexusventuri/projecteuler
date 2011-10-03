include FileUtils
require 'pathname'

RED="\e[00;31m"
YELLOW="\e[00;33m"
GREEN="\e[00;32m"
WHITE="\e[01;37m"
LIGHT_BLUE="\e[01;34m"

common_lib = "common/lib"

task :run_all do
  get_specs_dirs.each do |dir|
    execute_tests_in(dir)
  end
end

task :run_latest do
  most_recent_project = get_spec_dirs.sort{|a,b| File.mtime(a) <=> File.mtime(b)}.last
  execute_tests_in(most_recent_project)
end

def get_spec_dirs
  Dir['**/spec'].map{|dir| File.expand_path(dir + "/..")}
end

def execute_tests_in(basedir)
  spec_dir = Pathname.new(basedir).join("spec")
  lib_dir = Pathname.new(basedir).join("lib")
  if spec_dir.directory?
    print_header basedir

    output=`rspec #{spec_dir} -I #{lib_dir}`
    pretty_print_result(output)

    print_footer
  end
end

def print_header(dir)
    puts ""
    puts "executing tests in #{dir}"
end

def print_footer()
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
