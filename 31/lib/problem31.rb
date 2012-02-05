$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'quotient'

class Problem31
  attr_reader :partial_split
  def initialize()
    @currencies=[200, 100, 50, 20, 10, 5, 2, 1]
    @partial_split = {}
  end

  #never consider 11111
  def split(number, limit)
    puts "i'm here, #{number} #{limit}"
    return @partial_split[number] if !@partial_split[number].nil?
    splitted = @currencies.keep_if{|x| x <= number && x < limit}.inject([]){|acc, coin| acc << Quotient.new(number, coin); acc}
    puts splitted.count
    puts count_perfect_divisions(splitted)

    result = splitted.inject(0) do |acc, quotient|
      acc += (0..quotient.times).inject(0) do |acc, section|
        sub_splitting = quotient.rest + section * quotient.divisor
        puts "sub_splitting #{sub_splitting}"
        result = split(sub_splitting, quotient.divisor)
        @partial_split[sub_splitting] = result
        acc += result
        puts "acc: #{acc} result for #{sub_splitting}: #{result}"
        acc
      end
      acc
    end
    result + count_perfect_divisions(splitted)
  end

  def count_perfect_divisions(quotients)
    quotients.inject(0){|acc, x| acc += 1 if x.rest == 0; acc}
  end

  def count_permutations_from_base(splitted)
  end
end
