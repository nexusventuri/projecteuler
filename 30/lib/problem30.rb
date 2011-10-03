$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'divisors.rb'
class Problem30
  def top_limit(exponent)
    log_limit = (1..100).detect {|x| 9**exponent * x < 10**(x-1)} 
    9 ** exponent * log_limit
  end

  def find_sum_of_pow_of_digits_numbers(exponent)
    (2..(top_limit(exponent))).inject([]) do |acc, value|
      acc << value if calculate_sum_of_pow(value, exponent) == value
      acc
    end
  end

  def find_sum_of_all_sum_of_pow_of_digits_numbers(exponent)
    find_sum_of_pow_of_digits_numbers(exponent).inject(0){|acc, value| acc + value }
  end

  def calculate_sum_of_pow(value, exponent)
    value.digits.inject(0){|acc, digit| acc + digit ** exponent }
  end
end
