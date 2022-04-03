# frozen_string_literal: true

# Class to calculate the strong value of the character and deliver the message
class CharacterType
  attr_reader :twitter_word

  def initialize(twitter_word)
    @twitter_word = twitter_word
  end

  def strong_character; end
end
