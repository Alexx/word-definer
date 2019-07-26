require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  redirect to('/words')
end

get ('/words') do
  if params[:search] == nil
    @words = Word.all
    erb :words
  else
    @words = Word.search(params[:search])
    erb :search_results
  end
end

post ('/words') do
  name = params[:word_name]
  word = Word.new({:name => name})
  Word.save(word)
  redirect to('/words')
end

get ('/words/new') do
  erb :new_word
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb :word
end

post ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.new({:body => params[:word_body], :word_id => @word.id})
  Definition.save(definition)
  erb :word
end
