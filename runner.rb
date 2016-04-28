require_relative 'word'
require_relative 'parser'

parser = Parser.new('input.txt')
strings = parser.get_words(parser.normalize)

words = []

strings.each do |string|
  words << Word.new(string: string)
end

sorted = words.sort do |a, b|
  b.max_repeat <=> a.max_repeat
end

puts sorted.first.string