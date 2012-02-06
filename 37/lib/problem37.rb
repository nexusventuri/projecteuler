$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'

class Problem37

  def is_truncatable?(num)
    length = num.length10() -1
    left = num
    right = num
    (1..length).all? do
      left = left.remove_left_digit
      right = right.remove_right_digit
      left.prime? && right.prime?
    end
  end

  def find_eleven_truncatable_primes
    found = 0
    while found < 11
    end
  end
end
