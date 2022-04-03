# frozen_string_literal: true

require_relative 'class/1_payment_ibm_company_class' # manual_file lib, contain user_unemployed class

# Values ​​given by the user employee
print 'Introduzca el número de horas trabajadas por el usuario: '
worked_hours = gets.chomp.to_f # params[worked_hours], hours worked by employee

print 'Introduzca el pago por hora del usuario: '
avg_per_hours = gets.chomp.to_f # params[avg_per_hours], earnings per hour

avg_extra_hours = worked_hours - 48 # params[avg_extra_hours], extra hours worked by employee

# New object[current_user] instance to calculate:
# a.- function[current_user_weekly_salary], return hours worked for pay
# b.- function[current_user_avg_per_hours], return extra hours worked for pay (if any exist)
current_user = CalculateWeeklySalary.new(worked_hours, avg_per_hours)
current_user_weekly_salary = current_user.weekly_salary
current_user_avg_per_extra_hours =
  avg_extra_hours.positive? ? current_user.extra_hours_salary(avg_extra_hours) : 0

puts("El salario a pagar semanalmente al usuario de la nómina n°_itree_#{rand(500..1000)}
  es de: #{current_user_weekly_salary + current_user_avg_per_extra_hours}$")
