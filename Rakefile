include FileUtils
require 'pathname'
require 'benchmark'
require 'nokogiri'
require 'open-uri'
require_relative 'helpers.rb'
require 'reverse-markdown'

common_lib = "common/lib"

desc "Runs all tests"
task :run_all do
  result_report{
    time {
      get_spec_dirs.sort.inject([]) do |acc, dir|
        acc << execute_tests_in(dir)
      end
    }
  }
end

desc "Get the list of all the folders"
task :problem_list do
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
task :create, [:problem_id] => [:problem_content] do |t, args|
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

desc "Reload all description"
task :all_desc do
  get_spec_dirs.keep_if{|name| name =~ /\d+$/}.each{|name| download_description name[/\d+$/]}
end

desc "Downloads the problem description"
task :desc, :problem_id do |t, args|
  problem_id = args.problem_id
  download_description(problem_id)
end

def download_description(problem_id)
  print_result_separator

  problem_url = "http://projecteuler.net/problem=#{problem_id}"
  puts "downloading from #{problem_url}"
  doc = Nokogiri::HTML.parse(open(problem_url))
  problem_content = doc.css('div.problem_content').to_s

  doc="#{problem_id}/doc"
  mkdir_p doc

  File.open("#{doc}/problem#{problem_id}.markdown", "w") do |file|
    problem_content = problem_content.gsub(/br\>/, "br />").gsub(/(<img[^>]+)>/, "\\1 />").gsub("\n", "")
    puts problem_content
    doc_content = ReverseMarkdown.new.parse_string problem_content
    puts "Content:\n#{doc_content}"
    file.write doc_content
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

    result = BuildResult.new(basedir, output, $?)
    result.pretty_print_result
    print_result_separator
  end
  
  result
end

def print_result_header(dir)
    puts ""
    puts "Executing tests in #{dir}"
end

def print_result_separator()
    puts ""
    puts "----------------------------------"
    puts ""
end

def time
  result = nil
  time = Benchmark.measure {result = yield}
  puts LIGHT_BLUE 
  puts "Total execution time:"
  puts time.total
  puts WHITE
  result
end

def result_report
  results = yield

  total_suites = results.length
  total_success = results.inject(0) do |acc, result| 
    acc += 1 if result.success?
    acc
  end

  tests_without_results = results.inject([]) do |acc, result| 
    acc << result.problem_number if !result.has_solution? && result.problem?
    acc
  end

  puts "We ran #{total_suites} test suites and had #{total_success} success and #{total_suites - total_success} failures"
  puts "It seems there many tests without results(#{tests_without_results.length}), to be precise here's the list:\n* #{tests_without_results.join("\n* ")}" if tests_without_results.length > 0 
  puts
end
