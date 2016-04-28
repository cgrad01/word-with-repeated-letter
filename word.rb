class Word

  attr_reader :string, :repeat_amount
  attr_accessor :letter_counts

  def initialize(args = {})
    @string = args[:string]
    @letter_counts = self.get_count_hash
    self.count_letters
    @max_repeat = self.get_max
  end

  def get_count_hash()
    result = {}
    letters = self.string.split("").uniq
    letters.each do |letter|
      result[letter] = 0
    end
    return result
  end

  def count_letters()
    self.letter_counts.each_key do |key|
      self.string.chars.each do |char|
        if key == char
          self.letter_counts[key] +=1
        end
      end
    end
  end

  def get_max()
    self.letter_counts.values.sort[-1]
  end

end