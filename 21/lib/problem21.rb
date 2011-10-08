$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'

class Problem21
  def get_amicable(number)
    possible_amicable = number.sum_of_proper_divisors
    return nil if possible_amicable == number
    other_amicable = possible_amicable.sum_of_proper_divisors

    return nil if other_amicable != number
    possible_amicable
  end

  def get_all_amicable(limit)
    (2..limit).inject([]) do |result, x|
      amicable = get_amicable(x) 
      unless(amicable.nil?)
        result << x
      end
      result
    end
  end

end
