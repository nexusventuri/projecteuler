require 'problem28'
require 'solution_printer'

describe Problem28 do
  it "Should calculate size for 1x1" do
    Problem28.new.calculate(1).should == 1
  end

  it "Should calculate size for 3x3" do
    Problem28.new.calculate(3).should == 25
  end

  it "Should calculate size for 5x5" do
    Problem28.new.calculate(5).should == 101
  end

  it "Should calculate size for 1001x1001" do
    result = print_solution{Problem28.new.calculate(1001)}
    result.should == 669171001
  end
end
