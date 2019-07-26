require('rspec')
require('pry')
require('word')

describe('Word') do
  before(:each) do
    #code to run before each test
  end

  describe(".all") do
    it("should return an empty array when no words are added") do
      expect(Word.all).to(eq([]))
    end
  end
  
end
