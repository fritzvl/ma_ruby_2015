require 'awesome_print'
require 'active_model'

class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :name, :age, :awesome

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end
end

