require 'problem104'
require 'solution_printer'

describe Problem104 do
  it "should find end pandigital fibonacci" do
    result = Problem104.new.find_end_pandigital_fibonacci
    result.should == 541
  end

  it "should find start pandigital fibonacci" do
    result = Problem104.new.find_start_pandigital_fibonacci
    result.should == 2749
  end

  it "Should solve the problem" do
    solution = print_solution{Problem104.new.find_start_end_pandigital_fibonacci}
    solution.should == 329468
  end
end
