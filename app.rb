require 'sinatra'
require 'sinatra/reloader'
require './lib/task'
require 'pg'
also_reload('lib/**/*.rb')

DB = PG.connect({database: 'to_do'})

get '/' do
  @tasks = Task.all
  erb :index
end

get '/tasks' do
  description = params[:description]
  task = Task.new({description: description})
  task.save
  erb :success
end
