#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.
require File.expand_path("../config/boot.rb", __FILE__)

use MyMiddleware
# run Rack::URLMap.new "/hi"=>CustomRackApp.new, "/sinatra"=>Sinatra::Application

#
# run Rack::URLMap.new  "/"=>RootRackApp.new,"/hi"=>CustomRackApp.new, "/sinatra"=>Sinatra::Application
run Rack::URLMap.new  "/" => RootRackApp.new,
                      "/hi" => CustomRackApp.new,
                      '/example' => ExampleRackApp.new,
                      '/example_single_line' => ExampleSingleLineRackApp.new,
                      "/sinatra" => Sinatra::Application
#