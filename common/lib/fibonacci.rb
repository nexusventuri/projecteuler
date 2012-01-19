
class Fibonacci 
  def detect
    a = 1
    b = 1
    index = 2
    while ! yield index, a
      c = a
      a = a + b
      b = c
      index += 1
    end
    [index, a]
  end
end
