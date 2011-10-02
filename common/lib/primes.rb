class Primes
  def initialize()
    @last_index = 5
    @current_list = [2, 3]
  end

  def get(value)
    return @current_list if @last_index > value
    while(@last_index <= value) do
      divisor = @current_list.detect {|el| (@last_index % el) == 0}
      @current_list << @last_index if divisor.nil?
      @last_index = @last_index + 2
      @last_index = @last_index + 2 if @last_index % 3 == 0
    end
    @current_list
  end

  def get_till(value)
    computed_primes = get(value)
    max_index = computed_primes.index {|x| x > value} || computed_primes.length

    computed_primes[0, max_index]
  end
end
