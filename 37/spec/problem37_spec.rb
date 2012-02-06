require 'problem37'
require 'solution_printer'

describe Problem37 do
  it "Should find trucatable prime" do
    Problem37.new.is_truncatable?(3797).should == true
  end

  xit "Should solve the problem" do
    result = print_solution{"solveMe"}
    result.should == 0
  end
end
