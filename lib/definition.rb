class Definition
  attr_reader :id
  attr_accessor :body, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @body = attributes.fetch(:body)
    @word_id = attributes.fetch(:word_id)
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.body() == definition_to_compare.body()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def definitions
    Definition.find_by_word(self.id)
  end

  def word
    Word.find(self.word_id)
  end

  def self.save(definition)
    @@definitions[definition.id] = definition
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def update(body, word_id)
    self.body = body
    self.word_id = word_id
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end
end
