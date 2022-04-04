# frozen_string_literal: true

# Class to calculate the strong value of the character and deliver the message
class CharacterType
  attr_reader :twitter_word

  def initialize(twitter_word)
    @twitter_word = twitter_word
  end

  # 1.- Find if there is at least 1 type string
  # - if successful, return 1 else return 0
  def string_character
    return 1 if twitter_word.to_i.zero?

    0
  end

  # 1.- Find if there is at least 1 type number
  # - if successful, return 1 else return 0
  def number_character
    twitter_word =~ /\d/ ? 1 : 0
  end

  # 1.- Find if there is at least 1 type blank
  # - if successful, return 1 else return 0
  def blank_character
    twitter_word.include?(' ') ? 1 : 0
  end

  # 1.- Find if there is at least 1 type special/rarely
  # - if successful, return 1 else return 0
  def character_rarely
    special_character = "?<>',?[]}{=-)(*&^%$#`~{}" # stored rarely characters in params[special]
    concat_character = /[#{special_character.gsub(/./) { |char| "\\#{char}" }}]/ # concatenated special_character

    return 1 if twitter_word =~ concat_character

    0
  end

  # According to the calculations (length of the word by total_characters_found)
  # it'll return the security level being 0..10 unacceptable, 11..49 weak
  # and >= 50 strongest
  def responses_message(number)
    case number

    when 0..10
      return 'Unacceptable, passwords should receive a response suggesting that the sender try again with a better password.'
    when 11..49
      return 'Weak passwords should receive a modified version of the original tweet which has been strengthened enough to qualify as strong. The modified version should be no longer than the original, unless it must be lengthened to qualify as strong.'
    end

    'Strong passwords should receive a congratulatory tweet in response.'
  end
end
