# frozen_string_literal: true

# Module than calculate all existing zodiac signs to date
module ZoodiacSign
  def january(day)
    day < 20 ? '♑ Capricornio' : '♒ Acuario'
  end

  def february(day)
    day < 19 ? '♒ Acuario ' : '♓ Piscis'
  end

  def march(day)
    day < 21 ? '♓ Piscis' : '♈ Aries'
  end

  def april(day)
    day < 20 ? '♈ Aries' : '♉ Tauro'
  end

  def may(day)
    day < 21 ? '♉ Tauro' : '♊ Géminis'
  end

  def june(day)
    day < 21 ? '♊ Géminis' : '♋ Cáncer'
  end

  def july(day)
    day < 23 ? '♋ Cáncer' : '♌ Leo'
  end

  def august(day)
    day < 23 ? '♌ Leo' : '♍ Virgo'
  end

  def september(day)
    day < 23 ? '♍ Virgo' : '♎ Libra'
  end

  def october(day)
    day < 23 ? '♎ Libra' : '♏ Escorpio'
  end

  def november(day)
    day < 22 ? '♏ Escorpio' : '♐ Sagitario'
  end

  def december(day)
    day < 22 ? '♐ Sagitario' : '♑ Capricornio'
  end
end
