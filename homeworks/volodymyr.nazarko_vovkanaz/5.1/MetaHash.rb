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

  define_method :little? do
      personal_data['age'] <= 18
    end

    define_method :get_snake_name do
      additional_info["pets"].find {|i| i["species"] == "snake"}["name"]
    end

  define_method :gender? do
    personal_data['gender'] == 'female'
   
   end 

  define_method :add_new_hobby do |arg1='Girls', arg2='Lisa'|
    additional_info.merge({arg1=>[arg2]})
  end


  module InfoMethods

   def info_methods

       def initialize(text)
        @create_method = text
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
end


class << human

    def create_dynamic_method(text)
    instance_variable_set(:@create_method, text)
  end

end


p "Creating Dynamic Method:"
p " Added new Method #{human.create_dynamic_method('Work')}"
p "######################"
puts "User > 18?"
p human.little?
"######################"
puts "What's name of snake:"
puts human.get_snake_name
p "######################"
puts "Our user woman?:"
puts human.gender?
p "######################"
puts human.add_new_hobby