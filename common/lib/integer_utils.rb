require 'primes'
require 'benchmark'

module IntegerUtils
  @@primes = Primes.new
  @@factorials = {1=>1, 0=>1}

  def divisors
    Math.sqrt(self).floor().downto(1).inject([]) do |result, x| 
      if(self % x == 0) 
        result << x
        result << self/x if self/x != x
      end
      result
    end
  end

  def proper_divisors2
  end

  def proper_divisors
    divisors[0..-2]
  end


  def count_divisors
    divisors = get_factors
    divisors.values.reduce(1){|result, value| result * (value + 1)}
  end

  def get_factors
    inject_prime_factors({}) do |divisors_map, count, divisor| 
      divisors_map[divisor] = count
      divisors_map
    end
  end

  def inject_prime_factors(initial_value)
    remainder = self
    result = initial_value
    primes.get_till(Math.sqrt(remainder).floor).each do |x|
      count = 0
      while(remainder % x == 0)
        remainder = remainder/x
        count += 1
      end
      result = yield result, count, x if count > 0
      return result if remainder == 1
    end
    result = yield result, 1, remainder if remainder != 1
    result
  end

  def has_proper_prime_divisors?
    result = primes.get_till(Math.sqrt(self).floor + 2).detect{|x| self != x && self % x == 0}
    result.nil?
  end

  def prime?
    return false if self == 1
    has_proper_prime_divisors?
  end

  def abundant? 
    sum_of_proper_divisors > self
  end

  def perfect?
    sum_of_proper_divisors == self
  end

  def sum_of_divisors
    inject_prime_factors(1){|acc, count, prime| acc * (prime**(count+1) - 1)/(prime - 1)}
  end

  def sum_of_proper_divisors
    sum_of_divisors - self
  end

  def digits
    self.to_s.each_char.map{|x| x.to_i}
  end

  def factorial
    @@factorials[self] ||= self * (self - 1).factorial()
  end

  def pandigital?
    my_digits = digits 
    digits.sort == (1..my_digits.length).to_a
  end

  def primes_smaller
    primes.get_till(self)
  end

  def primes
    @@primes
  end
end

class Integer
  include IntegerUtils
end

def print_time(label)
  result = 0
  time = Benchmark.measure {result = yield}
  puts label
  puts "Total execution time:"
  puts time.total
  result
end


