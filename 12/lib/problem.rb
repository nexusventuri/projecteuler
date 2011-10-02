$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'divisors'

class Problem
  def triangle_from_index(index)
    (index * (index + 1))/2
  end

  def divisors_for_triangle(index)
    triangle_from_index(index).count_divisors
  end

  def first_more_than_divisor(lowerBond)
    found = false
    current_index = 0
    while(!found)
      current_index = current_index +1
      divisors = divisors_for_triangle(current_index)
      found = lowerBond < divisors
    end
    triangle_from_index(current_index)
  end
end
