require_relative 'word'
require_relative 'parser'

puts "After you have copied the input file into this folder, please input the name of the file (with extension) here:"
filename = $stdin.gets.chomp

parser = Parser.new(filename)
strings = parser.get_words(parser.normalize)
words = Word.make_words(strings)
words.sort!{|a,b| b.max_repeat <=> a.max_repeat}
puts words.first.string