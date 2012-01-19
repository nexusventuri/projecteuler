require 'fibonacci'

describe Fibonacci do
  it "Should find 3rd fibonacci number" do
    value = Fibonacci.new.detect{|index, x| index == 3}
    value.should == [3, 2]
  end

  it "Should find 4th fibonacci number" do
    value = Fibonacci.new.detect{|index, x| index == 4}
    value.should == [4, 3]
  end

  it "Should find 5th fibonacci number" do
    value = Fibonacci.new.detect{|index, x| index == 5}
    value.should == [5, 5]
  end
end

