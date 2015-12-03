class PersonBuilder
  def initialize(data_hash)
    @target=obj_reciever
    adding_attrib_accessor(data_hash)

  end

  private

  def method_missing(name, *args, &block)
    begin
      @target.send(:eval, "include #{name.to_s.capitalize}")
      begin
        self.send(name, *args, &block)
      rescue
        puts("Method \"#{name}\" is not defined.")
      end
    rescue
      puts("Method \"#{name}\" is not defined.")
    end
  end

  def obj_reciever
    class << self
      self
    end
  end

  def adding_attrib_accessor(datahash)
    datahash.each do |key, value|
      if value.instance_of?(Hash)
        adding_attrib_accessor(value)
      end
        @target.send(:define_method,"#{key.to_s}") do
        instance_variable_set("@#{key.to_s}", value)
        end
        begin
          @target.send(:eval, "include #{key.to_s.capitalize}")
        rescue
        end
    end
  end
end

module Age
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

module Profiles
  def profiles(method_name, value)
    eval "#{method_name} (value)"
  end

  def have?(arg)
    pattern = /((?<=www.)\w*)|((?<=\/\/)(?!w{3}.)\w*)/
    result=false
    social_profiles.each do |profiles|
      profiles =~ pattern
      if arg=$~.to_s+"er?"
        result=true
        break
      end
    end
    if result
      puts("yes")
    else
      puts("no")
    end
  end

  def how_many
    social_profiles.count
  end

  def some_method(arg)
    puts('May be in future...')
  end
end

module Hobby
  def like?(kind_of_hobby)
    hobby.include?(kind_of_hobby)
  end
end

module Pets
  def has?(species)
    pets.each do |pets_hash|
      if pets_hash.has_value?(species)
        break
      end
    end
  end
end

class Person < PersonBuilder
  def initialize(init_hash)
    @methods_before=methods
    super(init_hash)
  end

  def help
    puts(methods - @methods_before)
  end
end

require 'json'

RESPONSE = '{"person":{"personal_data":{"name":"John Smith", "gender":"male", "age":18},"social_profiles":["http://facebook.com","http://twitter.com","http://vk.com"],"additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"cat"},{"name":"Baloon","species":"dog"}]}}}'

response = JSON.parse(RESPONSE)

person_object=Person.new(response)
puts(person_object.name)
puts(person_object.teenager?)
puts(person_object.social_profiles)
puts(person_object.facebooker?)
puts(person_object.profiles("have?","facebook"))
puts(person_object.how_many)
puts(person_object.pets)
puts(person_object.like?("drinking"))
puts(person_object.has?("dog"))
puts(person_object.some_method("some_argument"))

other_p=Person.new(Hash.new)
puts other_p.name



