$:.unshift File.expand_path("../../../common/lib/", __FILE__)

class Problem28
  def calculate(num)
    (1..(num/2).floor).map {|x| 
      x * 2 + 1
    }.inject(1){|acc, edge_size|
      max = edge_size * edge_size
      min = max - ((edge_size - 1) * 3)
      acc + (max + min) * 2
    }
  end
end

