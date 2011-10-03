$:.unshift File.expand_path("../../../common/lib/", __FILE__)
class Problem26
  def find_longest_recurring_cycle_till(value)
    (1..value).inject({}) { |acc, number|
      acc[number] = Reciprocal.new(number).recurring_cycle
      acc
    }.max_by{|key, value| value.length}.first
  end
end

class Reciprocal
  def initialize(num)
    @num = num
  end
  def recurring_cycle
    rest = 1
    rest_list = []
    decimal_list = []
    while(rest != 0)
      index = rest_list.index(rest)
      return decimal_list[index..(-1)] unless index.nil? 
      rest_list << rest
      rest = rest * 10
      decimal_list << (rest / @num).floor
      rest = rest % @num
    end
    []
  end
end
