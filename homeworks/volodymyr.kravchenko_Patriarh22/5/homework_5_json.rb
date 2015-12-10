require 'json'

module Personal_data_module
  
  def methods_generate(data_hash, *parameters)
    parameters.each do |parameter|
      define_singleton_method "have_#{parameter.to_s}?" do
       data_hash[parameter.to_s] != nil
      end
    end
  end

end

module Social_profiles_module
  
  def methods_generate(data_array, *parameters)
    parameters.each do |parameter|
      define_singleton_method "have_#{parameter.to_s}?" do
        network_exist = false
        data_array.each do |profile|
          network_exist = true if profile.include? parameter.to_s
        end
        network_exist
      end
    end
  end

end

module Pets_module
  
  def methods_generate(pets_array, *parameters)
    parameters.each do |parameter|
      define_singleton_method "have_#{parameter.to_s}?" do
        pet_exist = false
        pets_array.each do |pet|
          pet_exist = true if pet["species"].include? parameter.to_s
        end
        pet_exist
      end
    end
  end

end

RESPONSE='{"person":{
              "personal_data":{
                "name": "John Smith",
                "personal_data":"male",
                "age":17}, 
              "social_profiles":["http://facebook.com/id123456","http://twitter.com/id123456","http://vk.com/id123456", 
                                 "http://ok.ru/id54321", "http://instagram.com/id54321"],
              "additional_info":{
               "hobby":["pubsurfing","drinking","hiking"],
               "pets":[{"name":"Mittens","species":"cat"},
                       {"name":"Doggy","species":"dog"},
                       {"name":"Alf","species":"cat"},
                       {"name":"Gentle death","species":"pyton"}]}}}'

response = JSON.parse(RESPONSE)

class MainClass

  def initialize(response)
    @@response = response
  end

  def build_profile
    p "================================================"
    p "--------------We get this person:---------------"
    p "================================================"
    @@response.each_pair do |hash_key, hash_value|
    Kernel.const_get("#{hash_key.capitalize}_Class").handler(hash_value) if !!Kernel.const_get("#{hash_key.capitalize}_Class") rescue false
    end
  end

end

class Personal_data_Class

  extend Personal_data_module

  def self.handler(personal_data_hash)
    methods_generate personal_data_hash, :name, :personal_data, :age
    "-------------Personal information---------------"
    p "Name: #{personal_data_hash['name']}" if have_name?
    p "Gender: #{personal_data_hash['personal_data']}" if have_personal_data?
    p "Age: #{adult(personal_data_hash['age'])}" if have_age?
    p "================================================"
  end

  def self.adult(person_age)
    person_age.to_i > 18 ? "adult" : "underage"
  end

  private_class_method :adult

end

class Social_profiles_Class

  extend Social_profiles_module

  def self.handler(social_profiles_array)
    @@usual_social_networks = []
    methods_generate social_profiles_array, :facebook, :twitter, :instagram
    p "--------------Uses social networks--------------"
    p "Facebook profile: #{check_social_networks(social_profiles_array, 'facebook')}" if have_facebook?
    p "Twitter profile: #{check_social_networks(social_profiles_array, 'twitter')}" if have_twitter?
    p "VKontakte profile: #{check_social_networks(social_profiles_array, 'instagram')}" if have_instagram?
    if other_social_networks?
      p "------------Exotic social networks--------------"
      (social_profiles_array - @@usual_social_networks).each {|profile| p profile}
    end
    p "================================================"
  end

  def self.check_social_networks(social_profiles_array, social_network)
      current_social_network = ''
      social_profiles_array.each do |profile|
        if profile.include? social_network
          current_social_network = profile
          @@usual_social_networks << current_social_network
        end 
      end
      return current_social_network
  end

  def self.other_social_networks?
    @@usual_social_networks != []
  end

  private_class_method :check_social_networks, :other_social_networks?

end

class Additional_info_Class

  def self.handler(additional_hash)
    p "--------------Additional information------------"
    additional_hash.each_pair do |hash_key, hash_value|
    Kernel.const_get("#{hash_key.capitalize}_Class").handler(hash_value) if !!Kernel.const_get("#{hash_key.capitalize}_Class") rescue false
    end
  end

end

class Hobby_Class

  def self.handler(hobby_array)
    p "Hobby: #{hobby_array.join(', ')}"
    p "------------------------------------------------"
  end

end

class Pets_Class

  extend Pets_module

  def self.handler(pets_array)
    methods_generate pets_array, :dog, :cat
    @@usual_pets = []
    p "Have dog(s): #{pets(pets_array, "dog").join(', ')}" if have_dog?
    p "Have cat(s): #{pets(pets_array, "cat").join(', ')}" if have_cat?
    (pets_array - @@usual_pets).each do |pet|
      p "Have exotic pet named #{pet['name']}, it is #{pet['species']}"
    end
    p "================================================"
  end

  def self.pets(pets_array, pet_species)
    pet_names = []
    pets_array.each do |pet|
      if pet['species'].include? pet_species 
        pet_names << pet['name']
        @@usual_pets << pet
      end
    end
    pet_names
  end

  private_class_method :pets

end

main = MainClass.new(response["person"]).build_profile if response.key?("person")
