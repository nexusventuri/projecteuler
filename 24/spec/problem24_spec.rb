require 'problem24'
require 'solution_printer'

describe Problem24 do
  it "Should solve the problem" do
    count = 0 
    solution = print_solution{[0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation do |current_permutation| 
        count += 1
        break current_permutation.join('') if count == 1000000
      end
    }
    solution.should == "2783915460"
  end
end
