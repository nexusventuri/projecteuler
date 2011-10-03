$:.unshift File.expand_path("../../../common/lib/", __FILE__)
require 'factorial'
require 'divisors'

class Problem34
  def top_bound
    #There are just two numbers which satisfy the requisites. removing this code for now
    #(1..100).detect{|x| 9.factorial * x < 10 ** (x-1)}* 9.factorial
    40585
  end

  def sum_of_digits_factorials
    (3..top_bound).inject([]) do |acc, number|
      acc << number if number.digits.inject(0){|rest, digit| rest + digit.factorial} == number
      acc
    end
  end

  def solution 
    sum_of_digits_factorials.inject(0){|acc, number| acc+number}
  end
end
