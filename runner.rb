alpha = "abcdefghijklmnopqsrtuvwxyz"
whitespace = " "

input = File.open("input.txt", "r")
content = input.read.downcase!

content = content.chars.select {|char| alpha.include?(char) || whitespace.include?(char)}

puts content.join