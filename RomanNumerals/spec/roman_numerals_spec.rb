require 'roman_numerals'

describe 'roman numerals' do
  context "numbers from 1 to 3" do
    it "shoud translate 1 to I" do
      1.roman.should == "I"
    end

    it "should translate 2 to II" do
      2.roman.should == "II"
    end
  end

  it "translates 4 to IV" do 
    4.roman.should == "IV"
  end

  it "translates 5 to V" do
    5.roman.should == "V"
  end

  it "translates 6, 7, 8" do 
    6.roman.should == "VI"
    7.roman.should == "VII"
    8.roman.should == "VIII"
  end

  it "translates 9" do
    9.roman.should == "IX"
  end

  it "translates 10" do
    10.roman.should == "X"
  end

  it "translates 14" do
    14.roman.should == "XIV"
  end

  it "translates 40" do
    40.roman.should == "XL"
  end

  it "translates 41" do
    41.roman.should == "XLI"
  end

  it "translates 49" do
    49.roman.should == "XLIX"
  end

  it "translates 50" do 
    50.roman.should == "L"
  end

  it "translates 90" do 
    90.roman.should == "XC"
  end

  it "translates 100" do 
    100.roman.should == "C"
  end

  it "translates 400" do 
    400.roman.should == "CD"
  end

  it "translates 500" do 
    500.roman.should == "D"
  end

  it "translates 900" do 
    900.roman.should == "CM"
  end

  it "translates 1000" do
    1000.roman.should == "M"
  end
end
