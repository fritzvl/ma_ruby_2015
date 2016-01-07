require 'json'

RESPONSE ='{"person":{
                "personal_data":{
                                 "name": "Dmitryi",
                                 "gender":"male",
                                 "age":20
                                 },
                "social_profiles":[
                                  "https://www.facebook.com/user",
                                  "http://vk.com/user",
                                  "https://www.instagram.com/user"
                                   ],
                "additional_info":{
                                  "hobby":["volleyball","billiards","swimming"],
                                  "pets":[{"name":"Bart","species":"Cat"},
                                          {"name":"Max","species":"Dog"},
                                          {"name":"Karl","species":"Iguana"}
                                          ]
                                  }
                    }
          }'

response = JSON.parse(RESPONSE)

class UserFactory

  def self.create_user(response)
    unless response["person"].nil?
      response["person"].each do |key, value|
        const_get("#{key.split('_').collect(&:capitalize).join}Builder").build(value)
      end
    end
  end

end


class PersonalDataBuilder

  def self.build(data)
    puts "-----------!We have new Person!-----------"
    puts "=========================================="
    puts "Personal info:"
    puts "------------------------------------------"

    data.each do |key, value|
      puts "#{key.to_s.capitalize} : #{value.to_s.capitalize}"
    end

    puts "=========================================="
  end

end


class SocialProfilesBuilder

  def self.build(data)
    puts "Social profiles:"
    puts "------------------------------------------"

    data.each do |value|
      puts "#{value.to_s}"
    end

    puts "=========================================="
  end

end


class AdditionalInfoBuilder

  def self.build(data)
    puts "Additional info:"
    puts "------------------------------------------"

    data.each do |key, value|
      if (key.to_s == 'hobby')
        puts "Hobbies: "

        value.each { |v| puts "#{v}" }

        puts "------------------------------------------"
      elsif (key.to_s == 'pets')
        puts "Pets: "

        value.each do |hash|
          hash.each do |k, v|
            puts "#{k.to_s.capitalize} : #{v.to_s.capitalize}"
          end
        end

        puts "------------------------------------------"
      else
        puts "#{key.to_s.capitalize} : #{value.to_s.capitalize}"
      end
    end
    puts "=========================================="
  end

end


UserFactory.create_user(response)