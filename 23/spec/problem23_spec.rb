$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'problem23'
require 'solution_printer'

describe Problem23 do
  it "Should get abundant numbers" do
    problem23.get_abundant_till(12).should == [12]
    problem23.get_abundant_till(13).should == [12]
  end

  it "Should find numbers which are sum of two abundant till a limit" do
    problem23.get_abundant_sums_till(24).should == {24=>true}
  end

  it "Should solve the problem" do
     solution = print_solution {problem23.sum_of_integers_not_sum_of_abundant}
     solution.should == 4179871
  end

  def problem23
    @problem23 = @problem23 || Problem23.new
  end
end
