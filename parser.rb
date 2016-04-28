class Parser

  attr_reader :filename

  $alpha = "abcdefghijklmnopqsrtuvwxyz"
  $whitespace = " "

  def initialize(filename)
    @filename = filename
  end

  def normalize()
    input = File.open(self.filename, "r")
    downcased = input.read.downcase
    letters_and_whitespace = downcased.chars.select do |char| $alpha.include?(char) || $whitespace.include?(char)
    end
    letters_and_whitespace.join
  end

  def get_words(normalized_string)
    normalized_string.split($whitespace)
  end

end