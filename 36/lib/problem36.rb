$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require "integer_utils"

class Problem36
  def verify(num)
    num.palindromic? && num.binary_palindromic?
  end

  def less_than(num)
    (1..num).inject(0) do |acc, val| 
      acc += val if verify(val)
      acc
    end
  end
end
