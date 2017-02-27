#ask the user for 2 numbers
#ask the user for an operation to perform
#perform the operation on the two numbers
#output the result

puts "Welcome to Calculator!"

puts "Please enter a number:"
num1 = gets.chomp.to_f

puts "Please enter a second number:"
num2 = gets.chomp.to_f

puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp.to_f


#case condition does not create a block, so the variable is accessible from the outside.

case operator
when 1
  result = num1 + num2
when 2
  result = num1 - num2
when 3
  result = num1 * num2
when 4
  result = num1 / num2
else
  puts "Please put in a valid command."
end

puts "The result is #{result}."