require('rspec')
require('pry')
require('word')

describe('Word') do
  before(:each) do
    Word.clear
  end

  describe('==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new({:name => "Elephant"})
      Word.save(word)
      word2 = Word.new({:name => "Elephant"})
      Word.save(word2)
      expect(word).to(eq(word2))
    end
  end

  describe(".all") do
    it("should return an empty array when no words are added") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.save') do
    it("saves a word to the words hash") do
      word = Word.new({:name => "Elephant"})
      Word.save(word)
      word2 = Word.new({:name => "Tree"})
      Word.save(word2)
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new({:name => "Elephant"})
      Word.save(word)
      word2 = Word.new({:name => "Tree"})
      Word.save(word2)
      word.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new({:name => "Elephant"})
      Word.save(word)
      word2 = Word.new({:name => "Tree"})
      Word.save(word2)
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new({:name => "Elephant"})
      Word.save(word)
      word.update("Doink")
      expect(word.name).to(eq("Doink"))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new({:name => "Elephant"})
      Word.save(word)
      word2 = Word.new({:name => "Tree"})
      Word.save(word2)
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('.search') do
    it('finds a word by name')do
    word = Word.new({:name => "Elephant"})
    Word.save(word)
    word2 = Word.new({:name => "Tree"})
    Word.save(word2)
    search = Word.search("Tree")
    expect(search).to(eq([word2]))
  end
end

end
