require "factorial"

describe FactorialModule do
  it "Should calculate factorial for 0 and 1" do
    0.factorial.should == 1
    1.factorial.should == 1
  end

  it "Should calculate factorial for 3" do
    3.factorial.should == 6
    6.factorial.should == 720
  end

end
