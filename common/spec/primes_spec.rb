require 'primes'

describe Primes do
  it "Should return the list of primes till a certain number" do
    primes.get_all(1).should =~ [2,3]
    primes.get_all(2).should =~ [2,3]
    primes.get_all(3).should =~ [2,3]
    primes.get_all(4).should =~ [2,3,5]
    primes.get_all(5).should =~ [2,3,5]
    primes.get_all(41).should =~ [2,3,5,7,11,13,17,19,23,29,31,37,41]
    primes.get_all(1).should =~ [2,3,5,7,11,13,17,19,23,29,31,37,41]
  end 

  it "Should return part of the primes needed" do
    primes.get_till(1).should =~ []
    primes.get_till(2).should =~ [2]
    primes.get_till(41).should =~ [2,3,5,7,11,13,17,19,23,29,31,37,41]
    primes.get_till(2).should =~ [2]
    primes.get_till(42).should =~ [2,3,5,7,11,13,17,19,23,29,31,37,41]
  end

  it "Should let you loop till a certain value" do
    found = false
    primes.till(6) {|x| [2, 3, 5, 7].include?(x).should == true; found = true}
    found.should == true

    found = false
    primes.till(14) {|x| [2, 3, 5, 7, 11, 13, 17].include?(x).should == true; found = true}
    found.should == true
  end

  def primes
    @primes = @primes || Primes.new
  end
end
