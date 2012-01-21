$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'integer_utils.rb'

class Problem27
  def count_prime(a, b)
    n = 0
    partial = (n**2 + a*n + b)
    while partial > 0 && partial.prime?
      n += 1
      partial = (n**2 + a*n + b)
    end
    n
  end

  def find_best_quadratics_product
    a, b, count = 0, 0, 0
    top_2000 = (-999..1000).each do |ax|
      all_found = (-999..1000).each do |bx| 
        tmp = count_prime(ax, bx)
        a, b, count = ax, bx, tmp if tmp > count
      end
    end
    a*b
  end

end
