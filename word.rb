class Word

  attr_reader :string, :max_repeat
  attr_accessor :letter_counts

  def initialize(args = {})
    @string = args[:string]
    @letter_counts = self.get_count_hash
    self.count_each_letter
    @max_repeat = self.get_max
  end

  def self.make_words(strings)
    strings.each_with_object([]) do |string, array|
      array << Word.new(string: string)
    end
  end

  def self.get_max_repeater(words)
    words.sort!{|a,b| b.max_repeat <=> a.max_repeat}
    words.first.string
  end

  def get_count_hash()
    count_hash = {}
    letters = self.string.split("").uniq
    letters.each do |letter|
      count_hash[letter] = 0
    end
    count_hash
  end

  def count_letter(word, letter)
    count = 0
    if word.include?(letter)
      if word[0] == letter
        count +=1
      end
      count += count_letter(word[1..word.length], letter)
    else
      0
    end
  end

  def count_each_letter()
    self.letter_counts.each_key do |key|
      self.letter_counts[key] = count_letter(self.string, key)
    end
  end

  def get_max()
    self.letter_counts.values.sort[-1]
  end

end