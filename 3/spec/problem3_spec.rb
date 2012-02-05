require 'problem3'
require 'solution_printer'
require 'integer_utils'

describe Problem3 do
  it "Should solve the problem" do
    result = print_solution{600851475143.get_factors.keys.max}
    result.should == 6857
  end
end
