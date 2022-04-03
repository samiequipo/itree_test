# frozen_string_literal: true

require 'byebug' # lib to debbuggin

# Class that calculates the probability that an employee will quit or be fired
# based on data such as his/her age, time in the company,
# sentimental status and number of children
class Unemployed
  attr_reader :user_age, :user_martial_status, :user_number_of_children, :user_hiring_time

  # Ctte
  TWO = 2
  THREE = 3
  SIX = 6
  TWELVE = 12

  # Initial user's attributes to be used as calculation of percentages of being unemployed
  def initialize(user_age, user_martial_status, user_number_of_children, user_hiring_time)
    @user_age = user_age # employee's age
    @user_martial_status = user_martial_status # can be single or married
    @user_number_of_children = user_number_of_children # number of children of the employee
    @user_hiring_time = user_hiring_time # employee's time in the company
  end

  # a.-
  # If the (user_children > 2) and his/her hiring_time > 12 months,
  # then returns 5% probability, otherwise, returns 0
  def two_children
    return 5 if user_number_of_children > TWO && user_hiring_time >= TWELVE

    0
  end

  # b.-
  # If the (user_status == 'casado') and his/her hiring_time is between(3..6) months,
  # then returns 15% probability, otherwise, returns 0
  def married
    return 15 if user_martial_status.downcase == 'casado' && between_three_six_month

    0
  end

  # c.-
  # If the (user_status == 'soltero') and his/her hiring_time is between(6..12) months,
  # then returns 10% probability, otherwise, returns 0
  def single
    return 10 if user_martial_status.downcase == 'soltero' && between_six_twelve_month

    0
  end

  # d.-
  # If the (user_age < 35) and his/her hiring_time is between(6..12) months,
  # then returns 30% probability, otherwise, returns 0
  def less_thirtyfive
    return 30 if user_age < 35 && between_six_twelve_month

    0
  end

  # e.-
  # If the (user_age >= 35) and his/her hiring_time is between(6..12) months,
  # then returns 5% probability, otherwise, returns 0
  def more_thirtyfive_sixmonth
    return 5 if user_age >= 35 && between_six_twelve_month

    0
  end

  # f.-
  # If the (user_age >= 35) and his/her hiring_time > 12 months,
  # then returns 20% probability, otherwise, returns 0
  def more_thirtyfive_year
    return 20 if user_age >= 35 && user_hiring_time >= TWELVE

    0
  end

  # Calculate the probability according to the longevity of the client in the company
  def new_customer(probability)
    case probability

    when 1..19
      return 'El cliente debe ser aprobado'
    when 20..40
      return 'El cliente debe ser revisado manualmente'
    when 40..100
      return 'El cliente debe ser rechazado'
    end

    '0% de Probabilidades'
  end

  # Construct and return the message for the probability of being unemployed
  def message_unemployed(unemployed_probability)
    original_message = 'El empleado tiene '

    message = "#{original_message} + #{user_number_of_children} hijos" if unemployed_probability[0].positive?

    message
  end

  protected

  # Return bool into user_hiring_time 3 <= between < 6
  def between_three_six_month
    user_hiring_time >= THREE && user_hiring_time < SIX
  end

  # Return bool into user_hiring_time 6 <= between < 12
  def between_six_twelve_month
    user_hiring_time >= SIX && user_hiring_time < TWELVE
  end
end
