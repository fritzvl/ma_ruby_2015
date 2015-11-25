require 'json'

module PersonAdult

  def adult?
    personal_data["age"] >= 18
  end

end

module MagicWords

  module ClassMethods

    def magic_methods

      define_method("amount_of_pets") do
        additional_info["pets"].length
      end

      define_method("pets_name") do
        pets_name = []
        additional_info["pets"].each {|pet| pets_name << pet["name"] }
        pets_name.join(", ")
      end

    end

  end

  def self.included(base)
    base.extend(ClassMethods)
  end

end

RESPONSE='{"person":{
                      "personal_data":{"name": "John Smith", "gender":"male", "age":56},
                      "social_profiles":["http://facebook.com/lala","http://twitter.com/lala","http://lala.ru"],
                      "additional_info":{"hobby":["pubsurfing","drinking","hiking"],
                                         "pets":[{"name":"Mittens","species":"сat"},
                                                 {"name":"Tom","species":"cat"},
                                                 {"name":"Ruby","species":"dog"}
                                                ]
                                        }
                    }
          }'

response = JSON.parse(RESPONSE)

Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do

  def have_hobbies?
    additional_info["hobby"].any?
  end

end

Person.class_eval do
  include PersonAdult
  include MagicWords

  magic_methods

end

person = Person.new(*response["person"].values)

person.instance_eval do

  def twitter_account?
    social_profiles.join.downcase.scan(/twitter/).any?
  end

end

p "adult?"
p person.adult?
p "twitter_account?"
p person.twitter_account?
p "have_hobbies?"
p person.have_hobbies?
p "amount_of_pets"
p person.amount_of_pets
p "pets_name"
p person.pets_name