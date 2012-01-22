$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require "integer_utils"
require "set"

class Problem32
  @@sorted_paradigital = "123456789".scan /./

  def pandigital19_product(a, b, c)
    if (a.to_s + b.to_s + c.to_s).scan(/./).sort == @@sorted_paradigital
      result 
    else
      0
    end
  end

  def find_sum_of_pandigital_products
    result = (1..1000).inject(Set.new) do |acc, a|
      b = a + 1
      over = false
      while b < 10000 && !over
        c = a * b
        asString = (a.to_s + b.to_s + c.to_s)

        over = true if asString.length > 9
        acc << c if asString.scan(/./).sort == @@sorted_paradigital
        b += 1
      end
      acc
    end

    result.inject{|sum,x| sum + x}
  end
end
