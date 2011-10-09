require 'problem31'
require 'solution_printer'

describe Problem31 do
  xit "should find number of ways to split 5p" do
    Problem31.new.split(5).should == 4
  end

  xit "should find number of ways to split 6p" do
    Problem31.new.split(6).should == 5
  end

  it "should count 0 for empty maps" do 
    splitted = {}
    Problem31.new.count_perfect_divisions(splitted).should == 0
  end

  it "should count 1 for map containing a single perfect divisor" do
    splitted = {}
    splitted[2] = Quotient.new(4,2)
    Problem31.new.count_perfect_divisions(splitted).should == 1
  end

  it "should count each perfect divisor" do 
    splitted = {}
    splitted[2] = Quotient.new(10,2)
    splitted[5] = Quotient.new(10,5)
    Problem31.new.count_perfect_divisions(splitted).should == 2
  end

  it "should not count element that are not divided perfectly" do
    splitted = {}
    splitted[5] = Quotient.new(15,5)
    splitted[10] = Quotient.new(15, 10)
    Problem31.new.count_perfect_divisions(splitted).should == 1
  end

  xit "Should solve the problem" do
    result = print_solution{"solveMe"}
    result.should == 0
  end
end
