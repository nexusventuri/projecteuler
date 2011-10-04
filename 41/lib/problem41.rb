$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils'

class Problem41
  def pandigital_prime_till(limit)
    limit.downto(12).inject([]) do |list,number|
      list << number if number.pandigital? && number.prime?
      list
    end
  end

  def find_solution_pandigital(limit)
    limit.downto(12).detect do |number|
      number.pandigital? && number.prime?
    end
  end
end
