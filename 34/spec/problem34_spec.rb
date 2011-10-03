require 'problem34'
require 'solution_printer'

describe Problem34 do
  xit "[Performance] Should get actual top bound" do
    Problem34.new.top_bound.should == 2540160
  end

  it "Should get top bound for performance reasons" do
    Problem34.new.top_bound.should == 40585
  end

  xit "[Performance] Should find numbers which are sum of factorials of their numbers" do
    Problem34.new.sum_of_digits_factorials.should =~ [145, 40585]
  end

  it "Should solve the problem" do
    result = print_solution{Problem34.new.solution}
    result.should == 40730
  end
end
