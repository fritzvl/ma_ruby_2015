require 'rubygems'
require 'sinatra'
require 'shotgun'
require 'data_mapper'
require 'haml'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/tasks_manager.db")

class Project
  include DataMapper::Resource
  property :id,           Serial
  property :name,         String, :required => true
  property :description,  Text
  property :moderator,       String
  property :created_at,   DateTime
  property :updated_at,   DateTime
end

# list all
get '/projects' do
  @projects = Project.all
  haml :index
end
# add new
get '/projects/new' do
  @project = Project.new
  haml :new
end
# create new
post '/projects' do
  @project = Project.new(params[:project])
  if @project.save
    status 201
    redirect '/projects/' + @project.id.to_s
  else
    status 400
    haml :new
  end
end
# edit
get '/projects/edit/:id' do
  @project = Project.get(params[:id])
  haml :edit
end
# update
put '/projects/:id' do
  @project = Project.get(params[:id])
  if @project.update(params[:project])
    status 201
    redirect '/projects/' + params[:id]
  else
    status 400
    haml :edit
  end
end
# delete project confirmation
get '/projects/delete/:id' do
  @project = Project.get(params[:id])
  haml :delete
end
# delete
delete '/projects/:id' do
  Project.get(params[:id]).destroy
  redirect '/projects'
end
# show
get '/projects/:id' do
  @project = Project.get(params[:id])
  haml :show
end
DataMapper.auto_upgrade!

