$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'

class Problem23
  def get_abundant_till(num)
    (num).downto(1).inject([]) do |acc, number|
      acc << number if number.abundant?
      acc
    end
  end

  def get_abundant_sums_till(num)
    abundant = get_abundant_till(num)
    puts "abundants... we have in total #{abundant.length} numbers.."
    permutation_of_abundant = abundant.each_with_index.inject({}) do |acc, pair|
      o_value = pair[0]
      current_index = pair[1]
      abundant[current_index..-1].each do |i_value|
        acc[o_value + i_value] = true if (o_value + i_value) <= num
      end
      acc
    end
    permutation_of_abundant
  end

  def sum_of_integers_not_sum_of_abundant
    invalid_numbers = get_abundant_sums_till(28123)
    (1..28123).inject(0) do |acc, value|
      acc = value + acc unless invalid_numbers.has_key? value
      acc
    end
  end
end
