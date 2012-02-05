class Quotient
  attr_reader :rest, :times, :divisor
  def initialize(num, divisor)
    @divisor = divisor
    @rest = num % divisor
    @times = (num / divisor).floor
  end

  def has_rest?
    @rest != 0
  end

  def to_s
    "Quotient #{@rest + @times * @divisor}/#{@divisor} = #{@times} + #{@rest}"
  end
end
