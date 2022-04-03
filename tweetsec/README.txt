.................
A.- WordNet is a gem library that provides the words in the English language, 
as well as their meanings and other types of useful methods such as a 
network of words.

B.- This library is used in order to replace words with more than one character 
that exist in the English language.

C.- More information, visit: https://deveiate.org/code/wordnet/  
.................

1 .- Run the Main program
# 1.1.- install the following gems in your terminal:
gem install wordnet # Main english words library gem
gem install sequel # WordNet' Dependence to conect wordnet to sequels
gem install wordnet-defaultdb # WordNet' Dependence to use defaultdb

2.- Test wordnet in the irb ruby console
# 2.1.- require the following library inside the irb(main)>
require 'wordnet' # return true
require 'sequel' # return true
