require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index :locals =>{:number => number}
  # a = rand(1..100)
end
