require 'problem21'

describe Problem21 do
  before do
    @problem21 = Problem21.new
  end

  it "Should find amicable" do
    problem21.get_amicable(220).should == 284
    problem21.get_amicable(3).should == nil
    problem21.get_amicable(5).should == nil
  end

  it "should find amicable" do
    problem21.get_all_amicable(284).should =~ [220, 284]
  end

  it "should find the result" do 
    result = problem21.get_all_amicable(10000).inject(0){|result, num| result + num}
    puts ""
    puts "----------------------------------------"
    puts "* And the result is:"
    puts result
    puts "*"
    puts "----------------------------------------"
    result.should == 31626
  end

  def problem21
    return @problem21
  end
end
