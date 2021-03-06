require_relative 'word'
require_relative 'parser'
require_relative 'tests'

def run
  puts "After you have copied the input file into this folder, please input the name of the file (with extension) here:"
  parser = Parser.new()
  strings = parser.get_words(parser.normalize)
  words = Word.make_words(strings)
  Word.get_max_repeater(words)
end

p run
ask_about_tests