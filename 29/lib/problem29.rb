$:.unshift File.expand_path("../../../common/lib/", __FILE__)
class Problem29
  def distinct_terms(bases, exponents)
    all_terms = {}
    bases.each {|base|
      exponents.each {|exponent|
        all_terms[base ** exponent] = true
      }
    }
    all_terms.size
  end

  def distinct_terms_inject(bases, exponents)
    bases.inject({}) {|acc,base|
      exponents.inject(acc) {|inner_acc, exponent|
        inner_acc[base ** exponent] = true
        inner_acc
      }
    }.size
  end
end
