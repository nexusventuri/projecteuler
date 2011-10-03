require "problem26"
require "solution_printer"
describe Reciprocal do
  it "Should calculate recurring cycle" do
    Reciprocal.new(2).recurring_cycle.should == []
    Reciprocal.new(3).recurring_cycle.should == [3]
    Reciprocal.new(4).recurring_cycle.should == []
    Reciprocal.new(5).recurring_cycle.should == []
    Reciprocal.new(6).recurring_cycle.should == [6]
    Reciprocal.new(7).recurring_cycle.should == [1,4,2,8,5,7]
    Reciprocal.new(8).recurring_cycle.should == []
    Reciprocal.new(9).recurring_cycle.should == [1]
    Reciprocal.new(10).recurring_cycle.should == []
  end

end

describe Problem26 do
  it "Should find the longest recurring cycle in a range" do
    Problem26.new.find_longest_recurring_cycle_till(10).should == 7
  end

  it "Should find the longest recurring cycle in a range" do
    solution = print_solution{Problem26.new.find_longest_recurring_cycle_till(1000)}
    solution.should == 983
  end
end
