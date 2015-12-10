require 'json'

class Builder
  def initialize(string)
    j_person = JSON.parse(string)
    @name = j_person['person']['personal_data']['name']
    @gender = j_person['person']['personal_data']['gender']
    @age = j_person['person']['personal_data']['age']
    @social_profiles = j_person['person']['social_profiles']
    @hobby = j_person['person']['additional_info']['hobby']
    @pets = j_person['person']['additional_info']['pets']
    @adult = adult
    @social_account = social_account
    @hobbies = hobbies
  end

  def printer
    puts 'name: ' + @name
    puts 'gender: ' + @gender
    puts 'age: ' + @age.to_s
    puts 'social_profiles: ' + @social_profiles.to_s
    puts 'hobby: ' + @hobby.to_s
    puts 'pets: ' + @pets.to_s
    puts 'adult: ' + @adult.to_s
    puts 'social_account: ' + @social_account.to_s
    puts 'hobbies: ' + @hobbies.to_s
  end

  def adult
    if @age >= 21
      return true
    end
    if @age < 21
      false
    end
  end
  def social_account
    if @social_profiles.length > 0
      true
    end
  end
  def hobbies
    if @hobby.length > 0
      true
    end
  end
end

person = Builder.new('{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56},
                                  "social_profiles":["http://facebook","http://twitter","http://"],
                                  "additional_info":{"hobby":["pubsurfing","drinking","hiking"],
                                                     "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}')

person.printer


