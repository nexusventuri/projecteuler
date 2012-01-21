
require 'problem27'
require 'solution_printer'

describe Problem27 do
  it "Should count correctly Euler example" do
    Problem27.new.count_prime(1, 41).should == 40
  end

  it "Should solve the problem" do
    result = print_solution{Problem27.new.find_best_quadratics_product}
    result.should == -59231
  end
end
