require 'problem37'
require 'solution_printer'

describe Problem37 do

  it "Should solve the problem" do
    result = print_solution{Problem37.new.find_eleven_truncatable_primes}
    result.should == 748317
  end
end
