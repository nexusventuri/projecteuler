def print_solution
  puts 
  puts "------------------------------------------"
  puts
  puts "* And the solution is...."
  value = yield
  puts value
  puts
  puts "------------------------------------------"
  puts
  value
end
