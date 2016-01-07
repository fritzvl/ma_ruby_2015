class PersonCreator
  def self.init(dat, data_hash)
    if data_hash.key?("person")
      adding_attrib_accessor(dat, data_hash["person"])
      PersonalData::init(dat)
      SocialProfiles::init(dat)
      AddititonalInfo::init(dat)
      class << dat
        include PersonalData, SocialProfiles, AddititonalInfo
      end
      end
   end
 
 
  def self.adding_attrib_accessor(dat_reciver, datahash)
    datahash.each do |key, value|
      if value.instance_of?(Hash)
        adding_attrib_accessor(dat_reciver, value)
      end
      dat_reciver.class.send(:define_method, "#{key.to_s}") do
        instance_variable_set("@#{key.to_s}", value)
       end
     end
   end
end
 
  
module Data
  def self.init(dat)
    if dat.respond_to?(:age)
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
 
 module SocialProfile
  def self.init(dat)
    if dat.respond_to?(:social_profile)
      pattern = /((?<=www.)\w*)|((?<=\/\/)(?!w{3}.)\w*)/
      dat.social_profile.each do |profile|
        profiles =~ pattern
        define_method(($~.to_s+"er?").to_sym){true}
      end

      def how_many_social_profile
        social_profile.count
      end
     end
  end
 end
 
 module AdditInfo
  def self.init(dat)
    if dat.respond_to?(:hobby)
      def like?(kind_of_hobby)
        hobby.include?(kind_of_hobby)
      end
    end

    if dat.respond_to?(:pets)
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
 
   def rescue

 
 require 'json'
 


RESPONSE = '{"person":{"personal_data":{"name":"Will Smith", "gender":"male", "age":18},"social_profiles":["http://facebook.com","http://twitter.com","http://vk.com"],"additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"cat"},{"name":"Baloon","species":"dog"}]}}}'
 
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
