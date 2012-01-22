require 'problem32'
require 'solution_printer'

describe Problem32 do
  it "Should solve the problem" do
    result = print_solution{Problem32.new.find_sum_of_pandigital_products}
    result.should == 45228
  end
end
