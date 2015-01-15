require ('rspec')
require ('term')

describe(Term) do
  before() do
    Term.clear()
  end

  describe("#word_array") do
    it("returns just the word") do
      test_term = Term.new(["cat"], ["a furry animal"])
      expect(test_term.word_array()).to(eq(["cat"]))
    end
  end

  describe('#definition_array') do
    it("returns just the definition") do
      test_term = Term.new(["dog"], ["barking animal"])
      expect(test_term.definition_array()).to(eq(["barking animal"]))
    end
  end

  describe('#save') do
    it('adds a term object to the array saved terms') do
      test_term = Term.new(["dog"], ["barking animal"])
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".clear") do
    it("empties out all the saved terms") do
      Term.new(["dog"], ["barking animal"]).save()
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("it returns the array of terms") do
      test_term = Term.new(["cat"], ["a furry animal"])
      test_term.save()
      test_term2 = Term.new(["dog"], ["barking animal"])
      test_term2.save()
      expect(Term.all()).to(eq([test_term, test_term2]))
    end
  end


end
