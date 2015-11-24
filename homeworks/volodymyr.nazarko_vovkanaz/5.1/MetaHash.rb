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


    end

  end

  def self.included(base)
    base.extend(InfoMethods)
  end

end


User = Struct.new(*pars['person'].keys.collect(&:to_sym)) do

 def little?
   if personal_data['age'] <= 16
     puts "Shkolota"
   else
     puts "Norm"
   end
 end

end



person = User.new(*pars["person"].values)

person.class.class_eval do
  include Info
 info_methods
  define_method :get_weight do
   puts "3500 kg"
  end
end


class << person
  def get_spoiler
    puts "Устанавливаем спойлер"
  end

  def add_more_power
    a = add_power * 2
    puts "Мы усилили наш двигатель на #{a} лошадей"
  end

end


p "Count of social_profiles"
person.social_profiles_size
p "sdqsadad"
person.little?
person.get_spoiler
person.get_weight