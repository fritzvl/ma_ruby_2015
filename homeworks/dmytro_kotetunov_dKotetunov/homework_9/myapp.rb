require 'rubygems'
require 'sinatra'
require 'shotgun'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/tasks_manager.db")
class Project
  include DataMapper::Resource
  property :id, Serial
  property :content, Text, :required => true
  property :created, DateTime
end
DataMapper.finalize.auto_upgrade!


get '/' do
  @projects = Project.all(:order => :created.desc)
  redirect '/new' if @projects.empty?
  erb :index
end

get '/new' do
  @title = "Create project"
  erb :new
end

post '/new' do
  Project.create(:content => params[:content], :created => Time.now)
  redirect '/'
end

get '/delete/:id' do
  @project = Project.first(:id => params[:id])
  erb :delete
end
post '/delete/:id' do
  if params.has_key?("ok")
    project = Project.first(:id => params[:id])
    project.destroy
    redirect '/'
  else
    erb :index
  end
end



