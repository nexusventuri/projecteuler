require 'problem29'
require 'benchmark'
require 'solution_printer'

describe Problem29 do
  it "Should give distinct terms number for example" do
    Problem29.new.distinct_terms(2..5, 2..5).should == 15
    Problem29.new.distinct_terms_inject(2..5, 2..5).should == 15
  end

  it "Should find result" do
    solution = print_solution{Problem29.new.distinct_terms(2..100, 2..100)}
    solution.should == 9183
  end
  
  xit "Should compare timing between inject solution and each loop" do
    problem = Problem29.new
    range = 2..150
    Benchmark.bm(7) do |x|
      x.report("each:"){problem.distinct_terms(range, range)}
      x.report("inject:"){problem.distinct_terms_inject(range, range)}
    end

  end
end
