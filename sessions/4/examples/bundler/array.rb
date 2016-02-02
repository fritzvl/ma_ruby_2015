# Move requirements

require 'rubygems'
require 'bundler/setup'

require 'active_support'
require 'active_support/core_ext/array'
require 'awesome_print'
require 'faker'

array = []
rand(13..17).times { array.push Faker::Lorem.sentence }

ap 'Base array'
ap array
ap '---===***  GROUPED ARRAYS  ***===---'

array.in_groups_of(3).each_with_index do |arr, i|
  ap "Grouped array #{i+1}"
  ap arr
  ap "Class: #{arr.class}"
end