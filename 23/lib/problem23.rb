$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'divisors'

class Problem23
  def get_abundant_till(num)
    (1..num).inject([]) do |acc, number|
      acc << number if number.abundant?
      acc
    end
  end

  def get_abundant_sums_till(num)
    abundant = get_abundant_till(num)
    permutation_of_abundant = abundant.each_with_index.inject({}) do |acc, pair|
      o_value = pair[0]
      current_index = pair[1]
      map_with_rest = abundant[current_index..-1].inject(acc) do |list_of_sums, i_value|
        list_of_sums[o_value + i_value] = true
        list_of_sums
      end
    end
    permutation_of_abundant.keep_if{|key, value| key <= num}
  end

  def sum_of_integers_not_sum_of_abundant
    invalid_numbers = get_abundant_sums_till(28123)
    (1..28123).inject(0) do |acc, value|
      acc = value + acc unless invalid_numbers.has_key? value
      acc
    end
  end
end
