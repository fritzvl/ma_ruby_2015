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

 def little?
   if personal_data['age'] <= 18
     puts "Teenager"
   else
     puts "Student"
   end
 end

end

human = User.new(*pars["person"].values)

human.class.class_eval do
  include Info
  define_method :get_snake_name do
    additional_info["pets"].find {|i| i["species"] == "snake"}["name"]
  end
end


class << human
  def gender
   if personal_data['gender'] == 'male'
     puts "Man"
   elsif personal_data['gender'] == 'female'
     puts "Woman"
   else
     puts "Something else"
   end
  end

  def create_dynamic_method(text)
    instance_variable_set(:@create_method, text)
  end

end

p "Creating Dynamic Method:"
p human.create_dynamic_method('work')
puts "Who is our  user"
human.little?
puts "What's name of snake:"
puts human.get_snake_name
puts "Our user is:"
puts human.gender
