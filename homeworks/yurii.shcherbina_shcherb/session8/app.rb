require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'sinatra'
require 'dm-core'
require 'dm-timestamps'
require 'dm-sqlite-adapter'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/database.sqlite3")
#DataMapper.setup(:default, 'jdbc:mysql://root:root@localhost:3306/session8')
DataMapper.finalize
DataMapper.auto_upgrade!

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :email, String
  property :passwd, String
  property :created_at, DateTime
end

get '/' do
  erb :index
end

get '/users/signup' do
  erb :signup
end

post '/users/new' do
  params.delete 'submit'
  @user = User.create(params)
  redirect '/users/#{@user.id}'
end

get '/users/:id' do
  if @user = User.get(params[:id]) then
    erb :users
  else
    redirect '/'
  end
end

delete '/users/:id/delete' do
  User.get(params[:id]).destroy
  redirect '/'
end

