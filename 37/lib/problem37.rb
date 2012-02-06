$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'

class Problem37

  def find_eleven_truncatable_primes
    found = []
    IntegerUtils.primes.till(748318) do |prime| 
      found << prime if prime.is_truncatable_prime?
      break if found.count == 11
    end
    found.inject(0){|acc, el| acc += el}
  end
end
