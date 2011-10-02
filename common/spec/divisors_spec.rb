require 'divisors'
describe Divisors do
  it "Should find divisor of primes" do
    divisors.find(1).should =~ [1]
    divisors.find(2).should =~ [1, 2]
    divisors.find(3).should =~ [1, 3]
    divisors.find(4).should =~ [1, 2, 4]
    divisors.find(6).should =~ [1, 2, 3, 6]
    divisors.find(28).should =~ [1, 2, 4, 7, 14, 28]
  end

  it "Should count the number of divisors" do
    divisors.count(1).should == 1
    divisors.count(2).should == 2
    divisors.count(3).should == 2
    divisors.count(4).should == 3
    divisors.count(6).should == 4
    divisors.count(9).should == 3
    divisors.count(28).should == 6
  end


  def divisors
    @divisors = @divisors || Divisors.new
  end
end
