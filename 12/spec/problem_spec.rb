require 'problem.rb'
describe Problem do
  it "Should get triangle number from index" do
    Problem.new.triangle_from_index(1).should == 1
    Problem.new.triangle_from_index(2).should == 3
    Problem.new.triangle_from_index(3).should == 6
    Problem.new.triangle_from_index(7).should == 28
  end

  it "Should count divisors for a triangle number" do
    divisors = Problem.new.divisors_for_triangle(7) > 5
  end

  it "should filter by predicate" do
    Problem.new.first_more_than_divisor(15).should == 120
  end

  it "should calculate problem result" do 
    result = Problem.new.first_more_than_divisor(500)
    puts ""
    puts "----------------------------------------------"
    puts "* Result:"
    puts "* #{result}"
    puts "----------------------------------------------"
    result.should == 76576500
  end
end
