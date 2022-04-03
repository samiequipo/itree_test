# frozen_string_literal: true

# Calculate the user's salary according to his/her hours worked and pay per hour
class CalculateWeeklySalary
  attr_reader :worked_hours, :avg_per_hours

  # Initial user's attributes, [worked_hours] and [avg_per_hours]
  def initialize(worked_hours, avg_per_hours)
    @worked_hours = worked_hours
    @avg_per_hours = avg_per_hours
  end

  # extra_hours_salary[function], calculate overtime based on 50%
  def extra_hours_salary(avg_extra_hours)
    ((0.5 * avg_extra_hours) + avg_extra_hours) * avg_per_hours
  end

  # weekly_salary[function], calculates the weekly salary
  def weekly_salary
    return 48 * avg_per_hours if worked_hours > 48

    worked_hours * avg_per_hours
  end
end
