class PersonBuilder
  def self.init(obj, data_hash)
    #@data_hash = obj.instance_variable_get("@data_hash")
#    data_hash.each do |key, subhash|
      adding_attrib_accessor(obj, data_hash)
#    end
      PersonalData::init(obj)
      class << obj
        include PersonalData
      end
  end

  def self.adding_attrib_accessor(obj_reciver, datahash)
    datahash.each do |key, value|
      while value.instance_of?(Hash) do
        adding_attrib_accessor(obj_reciver, value)
      end
      obj_reciver.class.send(:define_method, "#{key.to_s}") do
        instance_variable_set("@#{key.to_s}", value)
      end
    end
  end
end

module PersonalData
#  def self.included(mod)
#    puts("#{self} included in #{mod}")
#    puts(@a1)
#  end

#  def self.method_added(method_name)
#    puts "Adding #{method_name.inspect}"
#    puts(@data_hash)
#  end
#  def adding_attrib_reader
#      @data_hash["person"]["personal_data"].each do |key, value|
#        self.class.send(:define_method, "#{key.to_s}") do
#          instance_variable_set("@#{key.to_s}", value)
#        end
#      end
        #1self.define_method("#{key.to_s}?") {instance_variable_set("@#{key.to_s}", value)}
  def self.init(obj)
    if obj.respond_to?(:age)
      def child?
        age <= 12
      end

      def teenager?
        (age > 12) && (age <= 19)
      end

      def adult?
        age >= 20
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
#    @data_hash=init_hash.clone
    if init_hash.key?("person")
      PersonBuilder.init(self, init_hash["person"])
#      class << self
#        include PersonBuilder
#      end
#      self.init
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
puts(person_object.name)
puts(person_object.teenager?)


