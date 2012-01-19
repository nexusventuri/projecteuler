$:.unshift File.expand_path("../../../common/lib/", __FILE__)
class Problem26
  def find_longest_recurring_cycle_upto(value)
    (1..value).map {|num| Reciprocal.new(num).recurring_cycle}
              .max_by {|val|val.length}.length + 1
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
