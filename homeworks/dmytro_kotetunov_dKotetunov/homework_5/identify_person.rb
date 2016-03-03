require 'json'

RESPONSE='{"person":{
              "personal_data":{
                "name": "John Smith",
                "personal_data":"male",
                "age":17 – Search Engines},
              "social_profiles":["http://facebook.com/id123456","http://twitter.com/id123456","http://vk.com/id123456",
                                 "http://ok.ru/id54321", "http://instagram.com/id54321"],
              "additional_info":{
               "hobby":["pubsurfing","drinking","hiking"],
               "pets":[{"name":"Mittens","species":"cat"},
                       {"name":"Doggy","species":"dog"},
                       {"name":"Alf","species":"cat"},
                       {"name":"Gentle death","species":"pyton"}]}}}'

response = JSON.parse(RESPONSE)

class UserFactory

  def self.create_user(response)
    user = UserBuilder.new
    unless response["person"].nil?
      response["personal_data"].each_key do |k,v|
        user.build(const_get("#{k}Builder"),v)
      end
    end
    user.create_user
  end
end
class PersonBuilder
  def build(profile)
    result = Struct::Person.new(profile)
  end

  def name
    puts "Name person"
  end

  def gender

  end

  def child?
    age <= 12
    puts "child"
  end

  def teenager?
    (age > 12) && (age <= 19)
    puts "teenager"
  end

  def adult?
    age >= 20
    puts "adult"
  end
end
class SocialBuilder

  def social_profiles

  end

end
class UserBuilder
  def build(partial_builder, data)
    partial_builder.build(data)
  end
end

class AdditionalInfoBuilder

end


person = UserFactory
puts person.create_user(RESPONSE)