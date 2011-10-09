$:.unshift File.expand_path("../../../common/lib/", __FILE__)

class Problem31
  def initialize()
    @currencies=[200, 100, 50, 20, 10, 5, 2, 1]
    @partial_split = {}
  end

  #never consider 11111
  def split(number)
    return @partial_split[number] if !@partial_split[number].nil?
    splitted = currencies.keep_if{|x| x < number}.inject({}){|acc, coin| acc[coin] = Quotient.new(number, num); acc}
    count = count_perfect_divisions(splitted)

  end

  def count_perfect_divisions(splitted)
    splitted.inject(0) do |acc, value| 
      acc = acc + 1 if !value[1].has_rest?
      acc
    end
  end

  def count_permutations_from_base(splitted)
  end
end



class Quotient
  attr_reader :rest, :times, :divisor
  def initialize(num, divisor)
    @divisor = divisor
    @rest = num % divisor
    @times = (num / divisor).floor
  end

  def has_rest?
    @rest != 0
  end
end
