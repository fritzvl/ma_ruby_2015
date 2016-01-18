require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models/location'

set :database, {adapter: "sqlite3", database: "base.sqlite3"}

class WeatherAggregatorApp < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/locations' do
    @locations = Location.all
    erb :'locations/index'
  end

  get '/locations/:id/show' do
    @location = Location.find(params[:id])
    erb :'locations/show'
  end

  get '/locations/new' do
    @location = Location.new
    erb :'locations/new'
  end

  post '/locations/new' do
    @location = Location.new(params)
    if @location.save
      redirect '/locations'
    else
      erb :'locations/new'
    end
  end

  get '/locations/:id/edit' do
    @location = Location.find(params[:id])
    erb :'locations/edit'
  end

  post '/locations/:id/edit' do
    @location = Location.find(params[:id])
    @location.update(name: params[:name], body: params[:body])
    if @location.save
      redirect '/locations'
    else
      erb :'locations/edit'
    end
  end

  get '/locations/:id/delete' do
    @location = Location.find(params[:id])
    @location.destroy
    redirect '/locations'
  end
end
