require 'yaml'

MESSAGES = YAML.load_file("mortgage_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

loan_amt = ''
loop do
  prompt("Please enter a loan amount:")
  loan_amt = gets.chomp

  if valid_number?(loan_amt)
    break
  else
    prompt(MESSAGES['valid_decimal'])
  end
end

annual_rate = ''
loop do
  prompt("Please enter the APR as a decimal:")
  annual_rate = gets.chomp

  if valid_number?(annual_rate)
    break
  else
    prompt(MESSAGES['valid_decimal'])
  end
end

loan_time_yr = ''
loop do
  prompt("Please enter the loan duration (in years):")
  loan_time_yr = gets.chomp

  if valid_number?(loan_time_yr)
    break
  else
    prompt(MESSAGES['valid_decimal'])
  end
end

monthly_rate = annual_rate.to_f / 12
loan_time_mth = loan_time_yr.to_f * 12
loan_amt = loan_amt.to_f

monthly_payment = loan_amt * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_time_mth)))
monthly_payment = (monthly_payment * 100).ceil / 100.0
prompt("The monthly payment is $#{monthly_payment}.")
