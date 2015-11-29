require 'json'

MyHash='{"person":{
                      "personal_data":{"name": "Yana Gavrik", "gender":"female", "age":23},
                      "social_profiles":["http://facebook.com/","http://twitter.com/","http://vk.ru","http://linkedin.com", "http://google.com.ua"],
                      "additional_info":{"hobby":["fighting","drinking","building networks"], 
                                         "pets":[{"name":"Tom","species":"сat"},
                                                 {"name":"Zmiyuchka","species":"snake"}
                                                ]
                                        }
                    }
          }'


pars = JSON.parse(MyHash)


module Info

  module InfoMethods



    def info_methods


      define_method :social_profiles_size do
          puts social_profiles.size
      end

       define_method :adult? do
        personal_data['age'] < 18
      end

      define_method :get_snake_name do
          additional_info["pets"].find {|i| i["species"] == "snake"}["name"]
      end
        
      define_method  :twit_account do
          social_profiles.join.scan(/vk.ru/).any?
      end
      
      define_method :add_new_hobby do |arg1='Girls', arg2='Lisa'|
          additional_info.merge({arg1=>[arg2]})
      end

    end
  end


  def self.included(base)
    base.extend(InfoMethods)
  end

end

User = Struct.new(*pars['person'].keys.collect(&:to_sym)) do
end

human = User.new(*pars["person"].values)

human.class.class_eval do
  include Info
  info_methods
end


puts "Count of social_profiles"
human.social_profiles_size
p "#############################"
puts "Does she adult?"
puts human.adult?
p "#############################"
puts "What's name of snake:"
puts human.get_snake_name
p "#############################"
puts "Does she have account in vk?"
puts human.twit_account
p "#############################"
puts "Adding new hobby"
puts human.add_new_hobby("Sport","Football")
puts "Last register in":
puts human.social_profiles.last

