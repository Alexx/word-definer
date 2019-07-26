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
  @words = Word.all
  erb :words
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
end

post ('/words/:id') do
  body = params[:body]
  definition = Definiton.new({:body => body, :word_id => @word.id})
  erb :word
end
