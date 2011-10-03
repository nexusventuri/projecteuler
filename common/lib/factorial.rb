module FactorialModule
  @@factorials = {1=>1, 0=>1}

  def factorial()
    @@factorials[self] ||= self * (self - 1).factorial()
  end
end

class Integer
  include FactorialModule
end
