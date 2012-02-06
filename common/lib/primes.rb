class Primes
  def initialize()
    @last_index = 3
    @current_list = [2, 3]
  end

  def get(value)
    return @current_list if @last_index >= value
    while(@last_index < value) do
      try_next end
    @current_list
  end

  def get_till(value)
    computed_primes = get(value)
    max_index = computed_primes.index {|x| x > value} || computed_primes.length

    computed_primes[0, max_index]
  end

  def till(value)
    @current_list.each{|x|
      return if x>value
      yield x
    }
    while @last_index <= value do
      try_next(){|x| yield x}
    end
  end

  def try_next()
    @last_index = @last_index + 2
    @last_index = @last_index + 2 if @last_index % 3 == 0
    divisor = @current_list.detect do |el| 
      break if el * el > @last_index
      (@last_index % el) == 0
    end
    if divisor.nil?
      @current_list << @last_index 
      yield @last_index if block_given?
    end
  end
end
