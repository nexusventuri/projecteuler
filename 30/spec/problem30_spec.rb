require 'problem30'
require 'solution_printer'

describe Problem30 do
  it "should find an appropriate limit for 4" do
    problem30.top_limit(4).should == 39366
  end
  it "should find an appropriate limit for 5" do
    problem30.top_limit(5).should == 413343
  end

  it "should calculate sum of pow correctly" do
    problem30.calculate_sum_of_pow(2, 5).should == 32
    problem30.calculate_sum_of_pow(12, 5).should == 33
    problem30.calculate_sum_of_pow(152, 5).should == 3158
  end

  it "should find numbers for exponent 4" do
    problem30.find_sum_of_pow_of_digits_numbers(4).should =~ [1634, 8208, 9474]
  end
 
  it "should find sum for exponent 4" do
    problem30.find_sum_of_all_sum_of_pow_of_digits_numbers(4).should == 19316
  end
 
  it "should find result for exponent 5" do
    result = print_solution{problem30.find_sum_of_all_sum_of_pow_of_digits_numbers(5)}
    result.should == 443839
  end

  def problem30
    @problem30 = @problem30 || Problem30.new
  end
end
