class Word
  attr_reader :id
  attr_accessor :name

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = id || @@total_rows += 1
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.all()
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def self.search(word_name)
    search_array = []
    @@words.each_value do |word|
      if word.name.match?(word_name)
        search_array.push(word)
      end
    end
    return search_array
  end

  def self.save(word)
    @@words[word.id] = word
  end

  def update(name)
    self.name = name
  end

  def delete()
    @@words.delete(self.id)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def definitions
    Definition.find_by_word(self.id)
  end

  def delete
    @@words.delete(self.id)
  end

end
