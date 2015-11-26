require 'json'
require './helper_module'

class Builder

  include Helper

  RESPONSE='{"person":{
              "personal_data":{
                "name": "John Smith",
                "personal_data":"male",
                "age":56
              }, 
              "social_profiles":["http://facebook.com/id123456","http://twitter.com/id123456","http://vk.com/id123456", 
                "http://ok.ru/id54321", "http://instagram.com/id54321"],
              "additional_info":{
               "hobby":["pubsurfing","drinking","hiking"],
               "pets":[{"name":"Mittens","species":"cat"},
                       {"name":"Doggy","species":"dog"},
                       {"name":"Alf","species":"cat"},
                       {"name":"Gentle death","species":"pyton"}
                      ]
              }
             }
            }'

  response = JSON.parse(RESPONSE)

  if response.key?("person")
    Struct.new("Person", *response["person"].keys.collect(&:to_sym))
    @person = Struct::Person.new(*response["person"].values)
  end

  p "================================================"
  p "--------------We get this person:---------------"
  p "================================================"
  p "-------------Personal information---------------"
  p "Name: #{@person.personal_data['name']}" if name?
  p "Gender: #{@person.personal_data['personal_data']}" if gender?
  p "Age: #{@person.personal_data['age']}" if age?
  p "================================================"
  p "--------------Uses social networks--------------"
  p "Facebook profile: #{@social_network}" if facebook?
  p "Twitter profile: #{@social_network}" if twitter?
  p "VKontakte profile: #{@social_network}" if instagram?
  if other_social_networks?
    p "------------Exotic social networks--------------"
    @other_social_networks.each {|profile| p profile}
  end
  p "================================================"
  p "--------------Additional information------------"
  p "Hobby: #{@person.additional_info['hobby'].join(', ')}" if hobby?
  if pets?
    p "Have dog(s): #{@dogs.join(', ')}" if dog?
    p "Have cat(s): #{@cats.join(', ')}" if cat?
    if exotic?
      @exotic.each do |pet|
        p "Have exotic pet named #{pet['name']}, it is #{pet['species']}"
      end
    end 
  end
  
end
