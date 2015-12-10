require 'json'

RESPONSE = '{
  "person":{
    "personal_data":{
      "name": "John Smith",
      "gender":"male",
      "age":56 },
    "social_profiles":["http://facebook....","http://twitter...","http://" ],
    "additional_info":{
      "hobby":["pubsurfing","drinking","hiking"],
      "pets":[{
        "name":"Mittens",
        "species":"Felis silvestris catus"
       }]
    }
  }
}'

response = JSON.parse(RESPONSE)

person_object = Struct.new("Person", *response["person"].keys.collect(&:to_sym))
person = person_object.new(*response["person"].values)
puts person

class Person


end


class PersonalData
  attr_accessor :name, :gender, :age

  def all_methods
    name
    gender
    age
  end


  def name

    puts "User name: #{@name}"

  end

  def gender

    puts "User gender: #{@gender}"

  end

  def age

    puts "User age: #{@age}"

  end

end
data = PersonalData.new
data.name = person["personal_data"]["name"]
data.gender = person["personal_data"]["gender"]
data.age = person["personal_data"]["age"]
data.all_methods

class SocialInfo
  attr_accessor :social_profiles

  def social_profiles

    puts "Social_information: #{@social_profiles}"


  end

end

social = SocialInfo.new
social.social_profiles = person["social_profiles"]
social.social_profiles


class AdditionalInfo
  attr_accessor :hobby, :pets_name, :pets_species

  def hobby

    puts "User hobby: #{@hobby}"

  end

  def pets_name

    puts "Name pets: #{@pets_name}"

  end

  def pets_species

    puts  "Pets species: #{@pets_species}"

  end


end
special_info = AdditionalInfo.new
special_info.hobby = person["additional_info"]["hobby"]
special_info.hobby
#special_info.pets_name = person["additional_info"][0]["name"]
#special_info.pets_species = person["additional_info"]["pets"]["species"]
#special_info.name
#special_info.species




