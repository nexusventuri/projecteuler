
require 'problem41'
require 'solution_printer'

describe Problem41 do
  it "Should find pandigital and prime numers" do
    Problem41.new.pandigital_prime_till(2143).should =~ [2143, 1423]
  end

  it "Should solve the problem" do
    # The limit is lower because from 1-9 any permutation is divisible by
    # 3 and the same for 1-8
    result = print_solution{Problem41.new.find_solution_pandigital(7654321)}
    result.should == 7652413
  end
end
