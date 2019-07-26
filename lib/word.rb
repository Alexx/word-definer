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

  def self.save(word)
    @@words[word.id] = word
  end

  def delete()
    @@words.delete(self.id)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end
end
