# frozen_string_literal: true

require 'byebug' # primitive lib to use date module
require 'date' # primitive lib to use date module
require_relative 'class/4_and_5_user_unemployed_class' # manual_file lib, contain user_unemployed class

puts 'Bienvenido al Programa que calcula de Probabilidad de desempleado... '
puts '... '
puts '... '
print 'Edad: '
user_age = gets.chomp.to_i

puts('Estado Civil - teclee la letra "s" para soltero/ otra letra para casado: ')
user_martial_status = gets.chomp == 's' ? 'soltero' : 'casado' # conditioning the user by keyboard

print('Cantidad de hijos: ')
user_number_of_children = gets.chomp.to_i
print 'Fecha de contratacion: '
print 'Día: '
user_hiring_day = gets.chomp.to_i
print 'Mes: '
user_hiring_month = gets.chomp.to_i
print 'Año: '
user_hiring_year = gets.chomp.to_i
print 'Tiempo a calcular en meses: '
user_hiring_time = gets.chomp.to_i

# Instantiate [current_user]object to access its methods and calculate the percentage
current_user =
  Unemployed.new(user_age, user_martial_status, user_number_of_children, user_hiring_time)

# all [current_user]methods in array
current_user_methods =
  %w[two_children married single less_thirtyfive more_thirtyfive_sixmonth
     more_thirtyfive_year]

# Initialize an [unemployed_probability]array to take all the
# probabilities and add them in params[total_unemployed_probability]
unemployed_probability = [] # stored all probability according to each method
unemployed_probability << current_user_methods.map { |method| current_user.send(method) }
total_unemployed_probability = unemployed_probability.first.sum # sum of probabilities

# byebug
# unemployed_message = current_user.message_unemployed(unemployed_probability.first)
# puts("a #{unemployed_message}")

puts
puts('Calculando Probabilidad...')
puts('...')
puts('...')
puts("El empleado con fecha de nacimiento #{user_hiring_day}/#{user_hiring_month}/#{user_hiring_year}")
puts('tiene las siguientes probabilidades de desempleo/renuncia')
puts("1.- #{total_unemployed_probability}% de probabilidad de que la persona renuncie ó quede desempleada")

probability = current_user.new_customer(total_unemployed_probability)
puts("2.- #{probability}")

if unemployed_probability.first.sum.zero?
  puts('Empleado con 0% de probabilidad')
else
  puts("3.- Cuenta con #{current_user.user_number_of_children} hijos,
    #{user_martial_status if unemployed_probability.first[1] || unemployed_probability.first[2]},
     de #{current_user.user_age} años y trabajando desde hace #{current_user.user_hiring_time} meses
     , por lo que tiene #{total_unemployed_probability}% de probabilidad")
end
