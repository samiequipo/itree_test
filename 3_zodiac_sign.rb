# frozen_string_literal: true

require 'date' # primitive lib to use date module
require_relative 'modules/zoodiac_sign' # manual_file lib, contain zodiacal function

# Class that allows you to calculate the zodiac sign,
# as well as your lucky number, and the total days, months and years of the person
class CalculateDate
  include ZoodiacSign # Module into folder modules/zoodiac_sign.rb
  attr_reader :current_user_day, :current_user_month, :current_user_year, :birthdate, :current_user_total_name,
              :date_today

  def initialize(current_user_total_name, current_user_day, current_user_month, current_user_year)
    @current_user_total_name = current_user_total_name # user's name
    @current_user_day = current_user_day # user's day birthday
    @current_user_month = current_user_month # user's day month
    @current_user_year = current_user_year # user's day years
    # birthdate[params], new instance with the user's date of birth
    @birthdate = Date.new(current_user_year, current_user_month, current_user_day)
    @date_today = Date.today # current date time
  end

  # Calculate Zodiac Sign given the user's date of birth
  # - transform the month into a String and call the function,
  #   example: send(may, 05) =~ def may(day) ... end
  # - this function is into modules/zoodiac_sign.rb
  # - Finally, return user's zoodiac sign
  def calculate_zoodiac
    send(Date::MONTHNAMES[birthdate.month].downcase, current_user_day)
  end

  # Calculate Number Days given the user's date of birth
  # - Calculates the difference between the current date[date_today] and the
  #   date of birthday[birthdate] and transforms the result into days
  # - Finally, return total number of days to the user's current date
  def age_in_days
    (date_today - birthdate).to_i
  end

  # Calculate Number Months given the user's date of birth
  # - Call the function[age_in_years] to get the age,
  #   then subtract 1 and multiply 12 to get the full months
  #   date of birthday[birthdate] and transforms the result into days
  # - Finally, adds the remaining months and returns the
  #   total number of months of the user
  def age_in_months
    ((age_in_years - 1) * 12) + date_today.mon
  end

  # Calculate Number Years given the user's date of birth
  # - current_days && current_month > user_birthday && user_birthmonth then
  #   rest calculate the difference between date_today.year - birthdate.year
  # - Else, calculate the difference between date_today.year - birthdate.year and
  #   substract 1
  def age_in_years
    if difference_day >= 0 && difference_month >= 0
      date_today.year - birthdate.year
    else
      ((date_today.year - birthdate.year) - 1)
    end
  end

  # Calculate User's Lucky Number
  # - First, with users' params[year] as an integer type it transform a string,
  #   then convert it to an array, examp => 1992.to_s => "1992".chars => ['1','9','9','2']
  # - Then, map array converting it from string to integer, exampl
  #   ['1','9','9','2'].map(&:to_i) => [1, 9, 9, 2]
  # - Next, I add the values ​​into the numeric array, => [1, 9, 9, 2].sum => 21
  # - If the result of the sum is greater than 9, then a recursion is made calling
  #   the function again with the digit already calculated, replacing the previous parameter
  #   => lucky_number(21)
  # - Finally, operation again is called and returns the lucky number
  #   => lucky_number(21) => return 3
  def lucky_number(year = current_user_year)
    current_user_lucky_number = year.to_s.chars.map(&:to_i).sum

    return current_user_lucky_number if current_user_lucky_number <= 9

    lucky_number(current_user_lucky_number)
  end

  protected

  # return subtraction between the current day and the day of birth
  def difference_day
    date_today.day - birthdate.day
  end

  # return subtraction between the current month and the month of birth
  def difference_month
    date_today.day - birthdate.day
  end

  # return subtraction between the current years and the years of birth
  def difference_years
    date_today.year - birthdate.year
  end
end

puts 'Introduzca su nombre y fecha de nacimiento indicando día, mes y año: '
print 'Nombre Completo: '
current_user_total_name = gets.chomp
print 'Día: '
current_user_day = gets.chomp.to_i
print 'Mes: '
current_user_month = gets.chomp.to_i
print 'Año: '
current_user_year = gets.chomp.to_i

current_user =
  CalculateDate.new(current_user_total_name, current_user_day, current_user_month, current_user_year)

current_user_total_days = current_user.age_in_days
current_user_total_months = current_user.age_in_months
current_user_total_years = current_user.age_in_years
current_user_zoodiac = current_user.calculate_zoodiac
current_user_lucky_number = current_user.lucky_number

puts("Según el estudio de ZodiacSign...,
  se obtuvieron los siguientes resultados del usuario #{current_user_total_name.capitalize}...")
puts('...')
puts('...')
puts("1.- Días totales desde que nació hasta la fecha actual: #{current_user_total_days} days")
puts("2.- Meses totales desde que nació hasta la fecha actual: #{current_user_total_months} months")
puts("3.- Años totales desde que nació hasta la fecha actual: #{current_user_total_years} years")
puts("4.- Su Signo Zodiacal es: #{current_user_zoodiac}")
puts("5.- Su Número de la suerte es: #{current_user_lucky_number}")
