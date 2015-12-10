class PersonBuilder
  def self.init(obj, data_hash)
    if data_hash.key?("person")
      adding_attrib_accessor(eigenclass_of_oject(obj), data_hash)
      PersonalData::init(obj)
      SocialProfiles::init(obj)
      AddititonalInfo::init(obj)
      class << obj
        include PersonalData, SocialProfiles, AddititonalInfo
        define_method("method_missing") do |id, *arguments|
          puts("Method \"#{id}\" is not defined.")
        end
        private :method_missing
      end
     end
  end

  def self.eigenclass_of_oject(my_object)
    class << my_object
      self
    end
  end

  def self.adding_attrib_accessor(obj_reciver, datahash)
    datahash.each do |key, value|
      if value.instance_of?(Hash)
        adding_attrib_accessor(obj_reciver, value)
      end
      obj_reciver.send(:define_method, "#{key.to_s}") do
        instance_variable_set("@#{key.to_s}", value)
      end
    end
  end
end

module PersonalData
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
  def self.init(obj)
    if obj.respond_to?(:social_profiles)
      pattern = /((?<=www.)\w*)|((?<=\/\/)(?!w{3}.)\w*)/
      obj.social_profiles.each do |profiles|
        profiles =~ pattern
        define_method(($~.to_s+"er?").to_sym){true}
      end

      def how_many_social_profiles
        social_profiles.count
      end

      def do_something_else
        puts('May be in future...')
      end

    end
  end
end

module AddititonalInfo
  def self.init(obj)
    if obj.respond_to?(:hobby)
      def like?(kind_of_hobby)
        hobby.include?(kind_of_hobby)
      end
    end

    if obj.respond_to?(:pets)
      def has?(species)
         pets.each do |pets_hash|
           if pets_hash.has_value?(species)
             break
           end
         end
      end
    end
  end
end

class Person
  def initialize(init_hash)
    @methods_before=methods
    PersonBuilder.init(self, init_hash)
  end

  def help
    puts(methods - @methods_before)
  end
end

require 'json'

RESPONSE = '{"person":{"personal_data":{"name":"John Smith", "gender":"male", "age":18},"social_profiles":["http://facebook.com","http://twitter.com","http://vk.com"],"additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"cat"},{"name":"Baloon","species":"dog"}]}}}'

response = JSON.parse(RESPONSE)

person_object=Person.new(response)
puts(person_object.help)
puts(person_object.name)
puts(person_object.teenager?)
puts(person_object.social_profiles)
puts(person_object.facebooker?)
puts(person_object.how_many_social_profiles)
puts(person_object.pets)
puts(person_object.like?("drinking"))
puts(person_object.has?("dog"))
puts(person_object.some_method("some_argument"))

other_p=Person.new(Hash.new)
puts other_p.name



