require 'active_record'
require 'sqlite3'
require './models/user'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(:development)
