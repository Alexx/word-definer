require('rspec')
require('word')
require('definition')
require('pry')

describe ('Definition') do

  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new({:name => "Elephant"})
    Word.save(@word)
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition2)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is grey', :word_id => @word.id})
      Definition.save(definition2)
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is grey', :word_id => @word.id})
      Definition.save(definition2)
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is grey', :word_id => @word.id})
      Definition.save(definition2)
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new({:name => "Fish"})
      Word.save(word2)
      definition = Definition.new({:body => 'It has no arms', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It swims', :word_id => word2.id})
      Definition.save(definition2)
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word = Word.new({:name => "Truck"})
      definition = Definition.new({:body => 'It is a vehicle', :word_id => word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is made of metal', :word_id => word.id})
      Definition.save(definition2)
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      expect(definition.word).to(eq(@word))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is grey', :word_id => @word.id})
      Definition.save(definition2)
      definition.update("It has a trunk", @word.id)
      expect(definition.body).to(eq("It has a trunk"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new({:body => 'It is a big mamal', :word_id => @word.id})
      Definition.save(definition)
      definition2 = Definition.new({:body => 'It is grey', :word_id => @word.id})
      Definition.save(definition2)
      definition.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end
end
