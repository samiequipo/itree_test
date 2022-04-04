# frozen_string_literal: true

require_relative 'class/2_student_average_class' # manual library with contain calculed average section list

# Calculate the mean of the section of the students
note_list = [] # params[note_list], array that will contain the notes of each student
grade = rand(1..9) # params[grade], used for print presentation purposes only

# Students list
puts 'Bienvenidos al programa que calcula la media de la sección_st_grade'
puts 'Por favor, siga las siguientes instrucciones...'
puts '...'
puts '...'
print "Introduzca el número de alumnos de la sección_st_#{grade}: "
total_students = gets.chomp.to_i # params[total_students], total number of students

# fill the array with the total grades of each student
puts 'Rellene la lista de notas a continuación: '
puts nil
while total_students != 0
  print "Nota del estudiante con Carnet_ID_#{rand(2354...6542)}: "

  note_student = gets.chomp.to_i # params[note_student], get note of each student

  if (0..20).include?(note_student) && note_student.is_a?(Integer)
    note_list << note_student

    total_students -= 1
  else
    puts 'Error, por favor introduzca una nota del 0..20'
  end
end

# instantiate a new object[current_list] sending all the notes contained in an
# [note_list] array
current_list = StudentAverage.new(note_list)

# Calculate the average of all grades
current_list_average = current_list.calculate_average_student

puts('...')
puts('...')
puts("1.- La media de nota para la sección #{grade} es de: #{current_list_average} ")
