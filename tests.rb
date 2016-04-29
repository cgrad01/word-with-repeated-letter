require_relative 'word'
require_relative 'parser'

test_parser = Parser.new(filename: "input.txt")

# test 1
puts "Parser tests:"
puts "  #initialize"
puts "    has a filename?"
puts "      #{!!(test_parser.filename)}"

normalized = test_parser.normalize

# test 2
puts "  #normalize"
puts "    returns a string?"
puts "      #{normalized.class == String}"
# test 3
puts "    contains only letters and whitespace?"
puts "      #{!(normalized.include?("!") || normalized.include?(",") || normalized.include?(":") || normalized.include?(".") || normalized.include?("-") || normalized.include?("#") || normalized.include?("'") || normalized.include?("?"))}"

strings = test_parser.get_words(normalized)

puts "  #get_words"
# test 4
puts "    returns an array?"
puts "      #{strings.class == Array}"
# test 5
puts "    contains only letters?"
puts "      #{!(strings.any?{|string| string.include?(" ")})}"

puts "Word tests:"

words = Word.make_words(strings)

puts "  #initialize"
# test 6
puts "    has a 'string' attribute?"
puts "      #{!!(words[0].string)}"
# test 7
puts "    has a 'letter_counts' attribute?"
puts "      #{!!(words[0].letter_counts)}"
# test 8
puts "    has a 'max_repeat' attribute?"
puts "      #{!!(words[0].max_repeat)}"

test_word = Word.new(string: "aaaa")

# test 9
puts "    calls the #count_each_letter method?"
puts "      #{test_word.letter_counts["a"] == 4}"
#test 10
puts "    calls the #get_max method?"
puts "      #{test_word.max_repeat == 4}"

# test 11
puts "  #make_words"
puts "    returns an array?"
puts "      #{words.class == Array}"
# test 12
puts "    contains only instances of Word?"
puts "      #{words.any?{|word| word.class == Word}}"
#test 13
result = Word.get_max_repeater(words)
puts "  #get_max_repeater"
puts "    returns the correct word?"
puts "      #{result == "banana"}"