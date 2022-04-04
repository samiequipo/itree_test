# frozen_string_literal: true

require 'sequel' # bbdb lib depended by 'wordnet' lib
require 'wordnet' # english dictionary lib
require 'byebug' # debbugin lib
require_relative 'character_type' # manual lib to make calculated

puts 'Welcome to the TweetSec Password Strength Evaluator...'
print('please enter your latest tweets: ')
twitter_word = gets.chomp # params[twitter_word], asks the user for the strong password by keyboard
length_word = twitter_word.length # length size of words strong password
dictionary_wordnet = WordNet::Lexicon.new # params[dictionary_wordnet], initialize dictionary
# dictionary_wordnet[:twitter_word]

strong_word = '' # params[strong_word], reemplaced twitter_word
reemplace_word = '' # params[reemplace_word], reemplaced twitter_word

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

# create a new instanced object[result] to do word strength calculations
result = CharacterType.new(twitter_word)

# calls the functions and adds 1 for each character found
strength_rating =
  result.string_character + result.number_character +
  result.blank_character + result.character_rarely

# Multiply the number of characters in numbers found by the length of the transformed word
strength_value = strength_rating * twitter_word.length
total_result = result.responses_message(strength_value)

puts '...'
puts '...'
puts "1.- Your original word was reemplaced by #{twitter_word}"
puts "2.- Your strenght value is: #{strength_value}"
puts "3.- Your response message is, #{total_result}"
