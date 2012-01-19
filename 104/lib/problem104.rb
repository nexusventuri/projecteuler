$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'
require 'fibonacci'

class Problem104
  def find_start_pandigital_fibonacci
    index, value = Fibonacci.new.detect{|index, value| value.start_pandigital?(1..9)}
    index
  end

  def find_end_pandigital_fibonacci
    index, value = Fibonacci.new.detect{|index, value| value.end_pandigital?(1..9) }
    index
  end

  def find_start_end_pandigital_fibonacci
    range = 1..9
    index, value = Fibonacci.new.detect{|index, value| value.end_pandigital?(range) && value.start_pandigital?(range) }
    index
  end
end
