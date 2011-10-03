$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'

class Problem21
  def get_amicable(number)
    possible_amicable = get_divisors_sum(number)
    return nil if possible_amicable == number
    other_amicable = get_divisors_sum(possible_amicable)

    return nil if other_amicable != number
    possible_amicable
  end

  def get_all_amicable(limit)
    (1..limit).inject([]) do |result, x|
      amicable = get_amicable(x) 
      unless(amicable.nil?)
        result << x
      end
      result
    end
  end

  def get_divisors_sum(number)
    number.proper_divisors.reduce(0){|result, x| result + x}
  end
end
