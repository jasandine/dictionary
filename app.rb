require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/term')

get('/') do
  @terms = Term.all()
  erb(:index)
end

post('/dictionary_term') do
  @terms = Term.all()
  word_array = [params.fetch('english_term'), params.fetch('spanish_term'), params.fetch('german_term')]
  definition_array = [params.fetch('definition1'), params.fetch('definition2'), params.fetch('definition3')]
  @term = Term.new(word_array, definition_array)
  @term.save()
  #erb(:index)
  redirect('/')
end

post('/search') do
  @terms = Term.all()
  @found_term = nil
  search_term = params.fetch('search')
  @terms.each() do |term|
    if term.word_array()[0] == search_term
      @found_term = term
    end
    @found_term
  end
  erb(:index)
end
