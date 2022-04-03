# frozen_string_literal: true

# REVISAR

# Class StudentAverage, calculates the average grade of the students
class StudentAverage
  attr_reader :total_note_list

  # stored a average note student into [total_note_list]
  def initialize(total_note_list)
    @total_note_list = total_note_list
  end

  # 1.- Calculate average of the list of students
  #  - function[total_note_list.sum], sum all array into one number, [2, 4] => 6
  #  - function[size], return a size of array, [2, 4].size => 2
  #  - function[to_f], transform to float type, [2, 4].size.to_f => 2.0
  #  - function[round(2)], rond to decimal size.to_f.round(2)=> 2.00
  # - Finally return (total_note_list.sum / total_note_list.size.to_f).round(2) =>
  #  - 6.00 / 2.00 => 3.00
  def calculate_average_student
    (total_note_list.sum / total_note_list.size.to_f).round(2)
  end
end
