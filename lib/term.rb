class Term
  @@terms = []

  define_method(:initialize) do |word_array, definition_array|
    @word_array = word_array
    @definition_array = definition_array
  end

  define_method(:word_array) do
    @word_array
  end

  define_method(:definition_array) do
    @definition_array
  end

  define_method(:save) do
    @@terms.push(self)
  end

  define_singleton_method(:clear) do
    @@terms = []
  end

  define_singleton_method(:all) do
    @@terms
  end



end
