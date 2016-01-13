require 'sinatra'
require 'bundler'

Bundler.require
require './model/customer.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite:./db/base.db')
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do 
  erb :'index'
end

get '/customers' do
  @customers = Customer.all
  erb :'customers/index'
end

get '/customers/new' do
  erb :'customers/new'
end

post '/customers/new' do
  params.delete 'submit'
  @customer = Customer.create(params)
  if @customer.save
    redirect '/customers'
  else
    erb :'customers/new'
  end
end

get '/customers/:id/edit' do
  @customer = Customer.get(params[:id])
  erb :'customers/edit'
end

put '/customers/:id/edit' do
  customer = Customer.get(params[:id])
  customer.name = (params[:name])
  customer.adress = (params[:adress])
  customer.e_mail = (params[:e_mail])
  customer.phone_number = (params[:phone_number])
  customer.save
  redirect '/customers'
end

get '/customers/:id/delete' do
  Customer.get(params[:id]).destroy
  redirect '/customers'
end