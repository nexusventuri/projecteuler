require 'problem36'
require 'solution_printer'

describe Problem36 do
  it "Should verify 585" do
    Problem36.new.verify(585).should == true
  end

  it "Should falsify 584444" do
    Problem36.new.verify(584).should == false
  end

  it "Should solve the problem" do
    result = print_solution{Problem36.new.less_than(1000000)}
    result.should == 872187
  end
end
