module PersonalData
  def self.included(mod)
     puts("#{self} included in #{mod}")
  end

def some_methods
  if @data_hash["person"].key?("personal_data")
    @data_hash["person"].["personal_data"].each do |key, value|
      define_method("#{key.to_s}") do |new_value|
        instance_variable_set("@#{key.to_s}", new_value)
      end
    end
  end
end
end

module SocialProfiles
end

module AddititonalInfo
end

class Person
  @data_hash=Hash.new
  def initialize(init_hash)
    @methods_before=methods
    @data_hash=init_hash.clone
    if init_hash.key?("person")
      class << self
        include PersonalData
      end
    end
  end

  def change
    class << self
      include PersonalData
    end
  end

  def help
    puts(methods - @methods_before)
  end
end

require 'json'


RESPONSE = '{"person":{"personal_data":{"name":"John Smith", "gender":"male", "age":56},"social_profiles":["http://facebook....","http://twitter...","http://"],"additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'

response = JSON.parse(RESPONSE)

p response

person_object=Person.new(response)
puts(person_object.help)
