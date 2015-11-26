module PersonalData
  def self.included(mod)
     puts("#{self} included in #{mod}")
  end

  def init
    if @data_hash["person"].key?("personal_data")
      @data_hash["person"]["personal_data"].each do |key, value|
        self.class.send(:define_method, "#{key.to_s}?") {instance_variable_set("@#{key.to_s}", value)}
      end
    end
  end

  def child?
    age? <= 12 ? true : false
  end

  def teenager?
    (age? > 12) && (age? <= 19) ? true : false
  end

  def adult?
    age? >= 20 ? true : false
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
      self.init
    end
  end

  def help
    puts(methods - @methods_before)
  end
end

require 'json'


RESPONSE = '{"person":{"personal_data":{"name":"John Smith", "gender":"male", "age":18},"social_profiles":["http://facebook....","http://twitter...","http://"],"additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'

response = JSON.parse(RESPONSE)

person_object=Person.new(response)
puts(person_object.help)
puts(person_object.name?)
puts(person_object.teenager?)


