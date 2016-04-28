class Word

  attr_reader :string
  attr_accessor :count_hash

  def initialize(args = {})
    @string = args[:string]
    @count_hash = self.get_count_hash
    self.count_letters
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
    self.count_hash.each_key do |key|
      self.string.chars.each do |char|
        if key == char
          self.count_hash[key] +=1
        end
      end
    end
  end

end