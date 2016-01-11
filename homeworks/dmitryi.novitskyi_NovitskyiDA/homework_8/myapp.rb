require 'sinatra'

class WeatherAggregatorApp < Sinatra::Base

  locations = [
      {"id" => 0, "country" => "Ukraine", "description" => "sometext1..."},
      {"id" => 1, "country" => "America", "description" => "sometext2..."}
  ]

  get '/' do
    erb :'index'
    # 'Hello all! Click here to start work with this site'
  end

  get '/locations' do
    @hash = locations
    erb :'locations/index'
  end

  get '/locations/:id/show' do
    @location = locations[params[:id].to_i]
    erb :'locations/show'
  end

  get '/locations/new' do
    erb :'locations/new'
  end

  post '/locations/new' do
    if params[:country].length == 0 && params[:description].length == 0
      erb :'locations/new'
    else
      hash = {"id" => locations.length, "country" => params[:country], "description" => params[:description]}
      locations << hash
      redirect '/locations'
    end
  end

  get '/locations/:id/edit' do
    @location = locations[params[:id].to_i]
    erb :'locations/edit'
  end

  post '/locations/:id/edit' do
    locations.each do |hash|
      if hash["id"] == params[:id].to_i
        hash["country"] = params[:country]
        hash["description"] = params[:description]
      end
    end
    redirect '/locations'
  end

  get '/locations/:id/delete' do
    locations.delete_at(params[:id].to_i)
    redirect '/locations'
  end
end
