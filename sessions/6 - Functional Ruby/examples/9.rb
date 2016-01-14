# 2014 homework example from https://github.com/klimmen/moc-ruby-2014-homework/blob/master/homework-5/parse_json.rb

require 'json'
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

#response["person"].each do |key, value|
#  name_class = key.split("_").map! {|a| a.capitalize}.join
#  if value.is_a?(Hash)
#   Struct.new(name_class,*value.keys.collect(&:to_sym))
#  else
#    Struct.new(name_class,key.to_sym)
#  end
#end

def create_classes (&name_class)
  Proc.new do |lambda|
    lambda.call(yield)
  end
end

def parse_person(person, &create_methods)
  person.each do |key, value|
    cleate_class = create_classes { key.split("_").map! {|a| a.capitalize}.join}
    lambda = ->(name_class){ Struct.new(name_class,*yield(key, value))}
    cleate_class.call(lambda)
  end
end

create_methods = ->(key, value) do
  if value.is_a?(Hash)
    value.keys.collect(&:to_sym)
  else
    key.to_sym
  end
end


parse_person(response["person"], &create_methods)


Struct::PersonalData.class_eval do
  def adult?
    age >= 18
  end
end
Struct::SocialProfiles.class_eval do
  def twitter_account?
    social_profiles.join.downcase.scan(/twitter/).any?
  end
end
Struct::AdditionalInfo.class_eval do
  def amount_of_pets
    pets.length
  end

  def pets_name
    pets_name = []
    pets.each {|pet| pets_name << pet["name"] }
    pets_name.join(", ")
  end

end
p "=================================================================="
personal_data = Struct::PersonalData.new(*response["person"]["personal_data"].values)
p personal_data.name
p personal_data.gender
p personal_data.adult?
p "=================================================================="
social_profiles = Struct::SocialProfiles.new(response["person"]["social_profiles"])
p social_profiles.social_profiles
p social_profiles.twitter_account?
p "=================================================================="
additional_info = Struct::AdditionalInfo.new(*response["person"]["additional_info"].values)
p additional_info.hobby
p additional_info.pets
p additional_info.amount_of_pets
p additional_info.pets_name
p "=================================================================="


