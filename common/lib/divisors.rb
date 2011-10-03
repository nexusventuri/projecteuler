require 'primes'

module DivisorModule
  @@primes = Primes.new
  def divisors
    Math.sqrt(self).floor().downto(1).inject([]) do |result, x| 
      if(self % x == 0) 
        result << x
        result << self/x if self/x != x
      end
      result
    end
  end

  def proper_divisors
    divisors[0..-2]
  end

  def count_divisors
    divisors = get_factors
    divisors.values.reduce(1){|result, value| result * (value + 1)}
  end

  def get_factors
    remainder = self
    divisors_map = {}
    primes.get_till(Math.sqrt(remainder).floor).each do |x|
      while(remainder % x == 0)
        remainder = remainder/x
        divisors_map[x] = (divisors_map[x] || 0)  + 1
      end
      return divisors_map if remainder == 1
    end
    divisors_map[remainder] = 1 if remainder != 1
    divisors_map
  end

  def prime?
    primes.get_till(self).last == self
  end

  def abundant? 
    sum_of_divisors > self
  end

  def perfect?
    sum_of_divisors == self
  end

  def sum_of_divisors
    proper_divisors.inject(0){|result, x| result + x} 
  end

  def digits
    self.to_s.each_char.map{|x| x.to_i}
  end

  def primes
    @@primes
  end
end

class Integer
  include DivisorModule
end
