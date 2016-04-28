require_relative 'word'
require_relative 'parser'

def run
  puts "After you have copied the input file into this folder, please input the name of the file (with extension) here:"
  parser = Parser.new()
  strings = parser.get_words(parser.normalize)
  words = Word.make_words(strings)
  words.sort!{|a,b| b.max_repeat <=> a.max_repeat}
  p words.first.string
end

run