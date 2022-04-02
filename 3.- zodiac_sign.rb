# frozen_string_literal: true

puts 'Bienvenidos a la prueba zodiacal'
user_total_name = get.chomp

# Dia y mes Fecha actual
current_day = get.chomp.to_i
current_month = get.chomp.to_i

# Dia,mes y año Usuario
user_birthday = get.chomp.to_i, get.chomp.to_i, get.chomp.to_i


puts 'Bienvenidos a la prueba zodiacal'
current_day =

  def self.validate(current_day, current_month)
    case
    when day >  

    when value.match(/[0-9]{8}[a-z]/i)
      return validate_nif(value)
    when value.match(/[a-wyz][0-9]{7}[0-9a-z]/i)
      return validate_cif(value)
    when value.match(/x[0-9]{7,8}[a-z]/i)
      return validate_nie(value)
    end

    false
  end
