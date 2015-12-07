require 'json'

PROBABLY_PERSON = JSON.parse( IO.read('./response.json') )

class Person
  def initialize(person_data)
    @data = person_data
  end

  def data
    @data
  end
end

class PersonBuilder

  def self.create_person
    if PROBABLY_PERSON['person']
      person = Person.new(PROBABLY_PERSON['person'])
      person.data.each do |key, value|
        module_name = key.split('_').collect(&:capitalize).join
        if module_exists?("#{module_name}")
          person.send(:extend, const_get("#{module_name}"))
        else
          p "Unknown data field **#{key}**"
          p "    Contains: #{value}"
        end
      end
      person
    else

    end

  end

  def self.module_exists?(module_name)
    module_to_check = Module.const_get(module_name)
    return module_to_check.is_a?(Module)
  rescue NameError
    return false
  end

end

module PersonalData
  def personal_data
    p '----------------------------------------------------'
    p 'Personal Info : '
    @data['personal_data'].each do |key, value|
      p "    #{key} : #{value}"
    end
    p '----------------------------------------------------'
  end

  def adult?
    @data['personal_data']['age'] >= 21
  end
end

module SocialProfiles
  def social_profiles
    p '----------------------------------------------------'
    p 'Social profiles : '
    @data['social_profiles'].each_with_index do |profile, i|
      p "    #{i + 1} - #{profile}"
    end
    p '----------------------------------------------------'
  end
end

module Pets
  def pets
    p '----------------------------------------------------'
    p 'Pets : '
    @data['pets'].each do |pet_obj|
      p "    Person has awesome #{pet_obj['species']} #{pet_obj['name']} "
    end
    p '----------------------------------------------------'
  end
end


# PersonInfoGetter.person_analise
person = PersonBuilder.create_person
p '********************************************************************************************'
p person.personal_data if person.respond_to?(:personal_data)
p person.social_profiles if person.respond_to?(:social_profiles)
p person.pets if person.respond_to?(:pets)
p '********************************************************************************************'
if person.respond_to?(:personal_data)
  p person.adult? ? 'Person is adult' : 'Person is not adult'
end

