require 'json'


RESPONSE = '{ "person": {
                         "personal_data": {
                                            "name": "Loren Brok",
                                            "age": 19,
                                            "email": "brok_loren@example.com"},
                         "social_profiles": ["https://github.com/loren", "https://www.facebook.com/loren.brok", "http://twitter.com/loren13"],
                         "additional_info": {"hobby": ["drawing", "rollers", "dancing", "hockey"]},
                         "pets": [{"species": "cat", "name": "Lisa"},
                                  {"species": "cat", "name": "Alex"},
                                  {"species": "duck", "name": "Duck"}]
                          }
            }'


response = JSON.parse(RESPONSE)

Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do

  def adult?
    if (defined? personal_data)&&(personal_data['age'])
      age = personal_data['age']
      age >= 16? true : false
    end
  end

 def social_accounts?
   accounts = false
    if defined? social_profiles
      social_profiles.each do |profile|
        if profile.scan(/twitter/).length > 0
          accounts = true
        end
      end
    end
   accounts
  end

  def what_kind?
    accounts = false
    if defined? social_profiles
      social_profiles.each do |profile|
        if profile.scan(/twitter/).length > 0
          accounts = true
        end
      end
    end
  end

  def have_hobbies?
    additional_info["hobby"].any?
  end

  def have_pets?
    if defined? pets
      true
    else
      false
    end
  end

end

person = Person.new(*response["person"].values)

puts "Adult?"
p person.adult?
p '-----------------------------------------------'

puts "Social_accounts?"
p person.social_accounts?
p '-----------------------------------------------'

puts "What kind social accounts?"
p person.what_kind?
p '-----------------------------------------------'

puts "Hobby?"
p person.have_hobbies?


p '-----------------------------------------------'
puts "Person has pets?: #{person.have_pets?}"