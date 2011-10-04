require 'integer_utils'

describe DivisorModule do
  it "Should find divisor for an Integer" do
    1.divisors.should =~ [1]
    2.divisors.should =~ [1, 2]
    3.divisors.should =~ [1, 3]
    4.divisors.should =~ [1, 2, 4]
    6.divisors.should =~ [1, 2, 3, 6]
    28.divisors.should =~ [1, 2, 4, 7, 14, 28]
    36.divisors.should =~ [1, 2, 3, 4, 6, 9, 12, 18, 36]
  end

  it "should find proper divisors of a number" do
    1.proper_divisors.should =~ []
    2.proper_divisors.should =~ [1]
    3.proper_divisors.should =~ [1]
    4.proper_divisors.should =~ [1, 2]
    6.proper_divisors.should =~ [1, 2, 3]
    28.proper_divisors.should =~ [1, 2, 4, 7, 14]
    36.proper_divisors.should =~ [1, 2, 3, 4, 6, 9, 12, 18]
  end

  it "Should count the number of divisors" do
    1.count_divisors.should == 1
    2.count_divisors.should == 2
    3.count_divisors.should == 2
    4.count_divisors.should == 3
    6.count_divisors.should == 4
    9.count_divisors.should == 3
    28.count_divisors.should == 6
    36.count_divisors.should == 9
  end

  it "Should state if a number is prime" do
    1.prime?.should == false
    2.prime?.should == true
    7.prime?.should == true
    9.prime?.should == false
    36.prime?.should == false
  end

  it "Should state if it's an abundant number" do
    1.abundant?.should == false
    6.abundant?.should == false
    12.abundant?.should == true
    16.abundant?.should == false
  end

  it "Should state if it's a perfect number" do
    6.perfect?.should == true
    12.perfect?.should == false
    16.perfect?.should == false
    28.perfect?.should == true
  end

  it "Should calculate factorial for 0 and 1" do
    0.factorial.should == 1
    1.factorial.should == 1
  end

  it "Should calculate factorial for 3" do
    3.factorial.should == 6
    6.factorial.should == 720
  end

  it "Should state if it's a pandigital number" do
    2143.pandigital?.should == true
    21345.pandigital?.should == true
    55994.pandigital?.should == false
    21.pandigital?.should == true
  end

  def divisors
    @divisors = @divisors || Divisors.new
  end
end
