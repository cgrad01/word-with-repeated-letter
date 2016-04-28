alpha = "abcdefghijklmnopqsrtuvwxyz"
whitespace = " "

input = File.open("input.txt", "r")
content = input.read.downcase!

content = content.chars.select {|char| alpha.include?(char) || whitespace.include?(char)}

content = content.join

words = content.split(whitespace)

puts words