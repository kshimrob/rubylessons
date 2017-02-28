require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'cn'

def messages(message)
  MESSAGES[LANGUAGE][message]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  if num == "0" 
    true
  elsif num.to_i == 0
    false
  else 
    true
  end
end

def operation_to_message(op)
  word = case op
        when 1
          'Adding'
        when 2
          'Subtracting'
        when 3
          'Multiplying'
        when 4
          'Dividing'
        end
  word
end

prompt(messages('welcome'))

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  num1 = ''
  loop do
    prompt(messages('num_prompt1'))
    num1 = gets.chomp

    if valid_number?(num1)
      num1 = num1.to_f
      break
    else
      prompt(messages('valid_num'))
    end
  end

  num2 = ''
  loop do
    prompt(messages('num_prompt2'))
    num2 = gets.chomp

    if valid_number?(num2)
      num2 = num2.to_f
      break
    else
      prompt(messages('valid_num'))
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  # MSG is a delimiter...can be whatever you want.

  prompt(operator_prompt)
  operator = ""
  loop do
    operator = gets.chomp.to_f

    if [1, 2, 3, 4].include?(operator) # %w(1 2 3 4) => array of STRINGS
      break
    else
      prompt("Must choose 1, 2, 3, or 4.")
    end
  end

  # case condition does not create a block,
  # so the variable is accessible from the outside.

  prompt("#{operation_to_message(operator)} the two numbers...")

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
    prompt(messages(valid_command))
  end

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for coming!")
