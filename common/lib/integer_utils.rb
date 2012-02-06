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

  def proper_divisors
    divisors[0..-2]
  end

  def count_divisors
    divisors = get_factors
    divisors.values.reduce(1){|result, value| result * (value + 1)}
  end

  def get_factors
    inject_prime_factors({}) do |divisors_map, count, prime| 
      divisors_map[prime] = count
      divisors_map
    end
  end

  def inject_prime_factors(initial_value)
    remainder = self
    result = initial_value
    @@primes.till(Math.sqrt(remainder).floor) do |x|
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
    result = @@primes.get_till(Math.sqrt(self).floor + 2).detect{|x| self != x && self % x == 0}
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

  def start_pandigital? (range)
    selection = self.to_s[0...range.count].scan(/./)

      selection.sort.join("") == (range).to_a.join("")
  end

  def end_digits(number)
    (self % (10 ** number))
  end

  def end_pandigital?(range)
    selection = end_digits(range.count).to_s.scan(/./)

    selection.sort.join("") == (range).to_a.join("")
  end

  def palindromic?
    as_string = self.to_s
    as_string == as_string.reverse
  end

  def binary_palindromic?
    as_binary_string = self.to_s(2)
    as_binary_string == as_binary_string.reverse
  end

  def primes_smaller
    @@primes.get_till(self)
  end

  def remove_left_digit
    self % (10 ** (self.length10() -1))
  end

  def remove_right_digit
    self / 10
  end

  def self.primes
    @@primes
  end

  def length10
    val = 1
    @lenght_base_10 ||= (1..1000000).detect{|x| (val *= 10) > self }
  end

  def is_truncatable_prime?
    return false if self < 10
    length = self.length10() -1
    left = self
    right = self
    (1..length).all? do
      left = left.remove_left_digit
      right = right.remove_right_digit
      left.prime? && right.prime?
    end
  end

end

class Integer
  include IntegerUtils
end

class Array
  def binarysearch(tf,lower=0, upper=length-1)
    return if lower > upper
    mid = (lower+upper)/2
    tf < self[mid] ? upper = mid-1 : lower = mid+1
    tf == self[mid] ? mid : binarysearch(tf,lower,upper)
  end
end

def print_time(label)
  result = 0
  time = Benchmark.measure {result = yield}
  puts label
  puts "Total execution time:"
  puts time.total
  result
end


