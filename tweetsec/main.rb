# frozen_string_literal: true

require 'sequel'
require 'wordnet'
require 'byebug'
require_relative 'character_type'

# dictionary_wordnet[:twitter_word]
twitter_word = gets.chomp # params[twitter_word], asks the user for the strong password by keyboard
ORIGINAL_WORD = twitter_word # ctte to not modify the value in the response
length_word = twitter_word.length # length size of words strong password
dictionary_wordnet = WordNet::Lexicon.new # params[dictionary_wordnet], initialize dictionary
# dictionary_wordnet[:twitter_word]

strong_word = ''
reemplace_word = ''
# word != '0' && word.to_i != 0

# iterated words
# %w[12password34 password1 goat m4]
# na -> is a word in english
# pe -> is a word in english
if length_word > 1
  twitter_word.chars.each_with_index do |word, index|
    if (word != '0' && word.to_i.zero?) && (length_word - 1) != index # check if word is a String
      strong_word += word
      reemplace_word = strong_word unless dictionary_wordnet[strong_word].nil? && strong_word.length > 1
    elsif strong_word.length > 1
      if !dictionary_wordnet[strong_word].nil?
        twitter_word.gsub!(strong_word, 't')
      elsif !dictionary_wordnet[reemplace_word].nil?
        mid_word = strong_word.sub(reemplace_word, '')
        twitter_word.gsub!(reemplace_word, 't')

        twitter_word.gsub!(mid_word, 't') unless dictionary_wordnet[mid_word].nil?

        strong_word = ''
        reemplace_word = ''
      end
    end
  end
end

result = CharacterType.new(twitter_word)

puts 'Welcome to the TweetSec Password Strength Evaluator...'
puts "Your original word #{ORIGINAL_WORD} was reemplaced by #{twitter_word}"
