# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Blog::Application.initialize!

require 'active_record/connection_adapters/postgresql_adapter'
