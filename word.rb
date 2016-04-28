class Word

  attr_accessor :string, :letters, :count

  def initialize(args = {})
    @string = args[:string]
    @letters = self.string.split("")
    @count = 0
  end

end