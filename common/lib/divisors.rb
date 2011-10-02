require 'primes'

class Divisors
  def initialize 
    @primes = Primes.new
  end

  def find(number)
    result = []
    (1..number).each() do |x| 
      result << x if (number % x == 0)
    end
    result
  end

  def count(number)
    divisors = getFactors(number)
    divisors.values.reduce(1){|result, value| result * (value + 1)}
  end

  def getFactors(remainder)
    divisors_map = {}
    @primes.get_till(Math.sqrt(remainder).ceil).each do |x|
      while(remainder % x == 0)
        remainder = remainder/x
        divisors_map[x] = (divisors_map[x] || 0)  + 1
      end
      return divisors_map if remainder == 1
    end
    divisors_map[remainder] = 1 if remainder != 1
    divisors_map
  end
end
