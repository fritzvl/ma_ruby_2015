require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./myapp"
  end
end