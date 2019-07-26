class Word
  attr_reader :id
  attr_accessor :name

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@words.values()
  end
end
