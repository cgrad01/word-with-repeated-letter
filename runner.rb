require_relative 'word'

alpha = "abcdefghijklmnopqsrtuvwxyz"
whitespace = " "

input = File.open("input.txt", "r")
content = input.read.downcase!

content = content.chars.select {|char| alpha.include?(char) || whitespace.include?(char)}

content = content.join

strings = content.split(whitespace)
words = []
strings.each do |string|
  words << Word.new(string: string)
end

sorted = words.sort do |a, b|
  b.max_repeat <=> a.max_repeat
end

sorted.each do |word|
  puts word.string
end