include FileUtils
require 'pathname'
require 'benchmark'
require 'nokogiri'
require 'open-uri'
require_relative 'helpers.rb'

common_lib = "common/lib"

desc "Runs all tests"
task :run_all do
  result_report{
    time {
      Project.all_projects.sort{|a,b| a.path <=> b.path}.inject([]) do |acc, project|
        acc << project.execute_tests
      end
    }
  }
end

desc "Run fast tests"
task :run_fast do
  result_report{
    time {
      Project.all_projects.sort{|a,b| a.path <=> b.path}.inject([]) do |acc, project|
        acc << project.execute_tests if !project.slow?
        acc
      end
    }
  }
end

desc "Get the list of all the folders"
task :problem_list do
end

desc "Runs latest modified directory"
task :latest do
  Project.most_recent.execute_tests
end

desc "Runs a specific test"
task :run, :problem_id do |t, args|
  Project.new(args.problem_id).execute_tests
end

desc "Runs all the tests in the common folder(a library that might be virtually be shared by any problem)"
task :pre_commit do
  Project.new("common").execute_tests
end

desc "Creates a Kata project"
task :kata, [:kata_name] do |t, args|
  kata_name = args.kata_name
  create_problem_lib kata_name
  create_problem_spec kata_name
end

desc "By default runs last problem and the tests from the common folder"
task :default => [:pre_commit, :latest] do 
end

desc "Creates a blank project with a problem{problem_id}.rb file and a problem{problem_id}_spec.rb file, the spec pointing to the problem and the problem pointing to the base directory for the common library"
task :create, [:problem_id] do |t, args|
  problem_id = args.problem_id
  create_problem_lib "Problem#{problem_id}", problem_id
  create_problem_spec "Problem#{problem_id}", problem_id
end

def create_problem_lib(name, folder = name) 
  lib="#{folder}/lib"
  mkdir_p lib

  File.open("#{lib}/#{camel_to_snake(name)}.rb", "w") do |file| 
    file.write problem_template(name)
  end
end

def create_problem_spec(name, folder = name)
  spec="#{folder}/spec"
  mkdir_p spec

  File.open("#{spec}/#{camel_to_snake(name)}_spec.rb", "w") do |file|
    file.write spec_template(name)
  end
end

def camel_to_snake(name)
  name.gsub(/([A-Z]+)/, "_\\1")
      .sub(/^_/, "")
      .downcase
end

desc "Reload all description"
task :all_desc do
  Project.all_projects.keep_if{|el| el.problem?}.each{|name| download_description name[/\d+$/]}
end

desc "Downloads the problem description"
task :desc, :problem_id do |t, args|
  problem_id = args.problem_id
  download_description(problem_id)
end

def download_description(problem_id)
  require 'reverse-markdown'
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

def spec_template(name)
"""
require '#{camel_to_snake(name)}'
require 'solution_printer'

describe #{name} do
  it \"I_represent_an_empty_test\" do
  end

  xit \"Should solve the problem\" do
    result = print_solution{\"solveMe\"}
    result.should == 0
  end
end
""".lstrip
end

def problem_template(name)
"""
$:.unshift File.expand_path(\"../../../common/lib/\", __FILE__)

class #{name}

end
""".lstrip
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

  total_failures = results.select {|result|!result.success?}

  tests_without_results = results.select{|result| !result.has_solution? && result.project.problem? }

  slow_tests = Project.slow_projects

  puts "We ran #{total_suites} test suites and had #{total_suites - total_failures.length} success and #{total_failures.count} failures"
  puts "The following tests failed:\n* #{total_failures.map{|failure| failure.name}.join("\n *")}" if total_failures.count > 0 
  puts
  puts "#{slow_tests.length} are marked as slow, here's the list of slow tests:\n* #{slow_tests.map{|result| result.name}.join("\n* ")}" if slow_tests.length > 0
  puts
  puts "It seems there some tests without results(#{tests_without_results.length}), to be precise here's the list:\n* #{tests_without_results.map{|result|result.name}.join("\n* ")}" if tests_without_results.length > 0 
  puts
  puts "And timing for tests:"
  results.each do |result|
    puts "#{result.name}:\t#{result.execution_time.total}s"
  end
end
