require 'sinatra'
require 'sinatra/reloader'
require './lib/task'
require './lib/list'
require 'pg'
also_reload('lib/**/*.rb')

DB = PG.connect({dbname: 'to_do_test'})

get '/' do
  erb :index
end

get '/lists/new' do
  erb :list_form
end

post '/lists' do
  name = params["name"]
  list = List.new({name: name, id: nil})
  list.save
  erb :success
end

get '/lists' do
  @lists = List.all
  erb :lists
end

get '/lists/:id' do
  @list = List.find(params[:id].to_i)
  erb :list
end
