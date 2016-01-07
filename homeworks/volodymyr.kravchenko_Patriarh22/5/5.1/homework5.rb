require 'json'

module PersonalDataModule
  
  def methods_generate(data_hash, *parameters)
    parameters.each do |parameter|
      define_singleton_method "have_#{parameter.to_s}?" do
        data_hash[parameter.to_s] != nil
      end
    end
  end

  def adult(person_age)
    person_age.to_i > 18 ? "adult" : "underage"
  end

end

module SocialProfilesModule

  attr_accessor :usual_social_networks
  
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

  def check_social_networks(social_profiles_array, social_network)
      current_social_network = ''
      social_profiles_array.each do |profile|
        if profile.include? social_network
          current_social_network = profile
          @usual_social_networks << current_social_network
        end 
      end
      current_social_network
  end

  def have_other_social_networks?
    @usual_social_networks != []
  end

end

module PetsModule

  attr_accessor :usual_pets
  
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

  def pets(pets_array, pet_species)
    pet_names = []
    pets_array.each do |pet|
      if pet['species'].include? pet_species 
        pet_names << pet['name']
        @usual_pets << pet
      end
    end
    pet_names
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

class Builder

  def self.build_profile(response)
    Struct.new("Person", *response.keys.collect(&:to_sym))
    person = Struct::Person.new(*response.values)
    p "================================================"
    p "--------------We get this person:---------------"
    p "================================================"
    response.each_pair do |key, value|
      ClassSearcher.search(person, key, value)
    end
  end

end

class ClassSearcher
  
  def self.search(person, key, value)
    classname = key.split('_').each {|word| word.capitalize!}.join
    Kernel.const_get("#{classname}Builder").handler(person) if !!Kernel.const_get("#{classname}Builder") rescue Stranger.handler(key, value)
  end

end

class PersonalDataBuilder
  
  def self.handler(person)
    person.instance_eval do
      extend PersonalDataModule
      methods_generate person.personal_data, :name, :personal_data, :age
    end
    p "-------------Personal information---------------"
    p "Name: #{person.personal_data['name']}" if person.have_name?
    p "Gender: #{person.personal_data['personal_data']}" if person.have_personal_data?
    p "Age: #{person.adult(person.personal_data['age'])}" if person.have_age?
    p "================================================"
  end

end

class SocialProfilesBuilder

  def self.handler(person)
    person.instance_eval do
      extend SocialProfilesModule
      methods_generate person.social_profiles, :facebook, :twitter, :instagram
    end
    person.usual_social_networks = []
    p "--------------Uses social networks--------------"
    p "Facebook profile: #{person.check_social_networks(person.social_profiles, 'facebook')}" if person.have_facebook?
    p "Twitter profile: #{person.check_social_networks(person.social_profiles, 'twitter')}" if person.have_twitter?
    p "Instagram profile: #{person.check_social_networks(person.social_profiles, 'instagram')}" if person.have_instagram?  
    if person.have_other_social_networks?
      p "------------Exotic social networks--------------"
      (person.social_profiles - person.usual_social_networks).each {|profile| p profile}
    end
    p "================================================"
  end

end

class AdditionalInfoBuilder

  def self.handler(person)
    p "--------------Additional information------------"
    person.additional_info.each_pair do |key, value|
    ClassSearcher.search(person, key, value)
    end
  end

end

class HobbyBuilder

  def self.handler(person)
    p "Hobby: #{person.additional_info['hobby'].join(', ')}"
    p "------------------------------------------------"
  end

end

class PetsBuilder

  def self.handler(person)
    person.instance_eval do
      extend PetsModule
      methods_generate person.additional_info['pets'], :dog, :cat
    end
    person.usual_pets = []
    p "Have dog(s): #{person.pets(person.additional_info['pets'], "dog").join(', ')}" if person.have_dog?
    p "Have cat(s): #{person.pets(person.additional_info['pets'], "cat").join(', ')}" if person.have_cat?
    (person.additional_info['pets'] - person.usual_pets).each do |pet|
      p "Have exotic pet named #{pet['name']}, it is #{pet['species']}"
    end
    p "================================================"
  end

end

class Stranger

  def self.handler(unknown_hash_key, unknown_hash_value)
    p "------------------------------------------------"
    p "We got an unknown JSON field #{unknown_hash_key}"
    p "This is it:"
    if unknown_hash_value.is_a?(Array)
      p unknown_hash_value.join(', ')
    elsif unknown_hash_value.is_a?(Hash)
      unknown_hash_value.each_pair {|key, value| p "#{key} - #{value}"}
    elsif unknown_hash_value.is_a?(String)
      p unknown_hash_value
    else
      p "It is unknown structure"
    end
    p "------------------------------------------------"
  end

end

Builder.build_profile(response["person"]) if response.key?("person")
