$:.unshift File.expand_path("../../../common/lib/", __FILE__)

class Tree
  def initialize(tree)
    @tree = tree
  end

  def tree
    @tree
  end

  def compute_line!(line_num)
    if(line_num > 0)
      current_line = @tree[line_num]
      prev_line = @tree[line_num -1]
      current_line[0] += prev_line[0]
      (1..(line_num-1)).each{|x| current_line[x] += [prev_line[x-1], prev_line[x]].max}
      current_line[line_num] += prev_line[line_num - 1]
    end
    self
  end

  def max_total
    (1..tree.length - 1).each{|x| compute_line!(x)}
    tree[tree.length() -1].max()
  end
end
