module ParsingModule

  module ClassMethods

    require 'json'


    def user_data(parameters)

      parameters = JSON.parse(parameters)

      unless parameters
        return
      end

      parameters.each do |key, value|
        if value.class == Hash
          p "User #{key}:"

          value.each do |name, val|
            p "#{name} -> #{val}"
          end
        else
          p "User #{key} -> #{value}"
        end
        puts
      end

    end

  end

  def self.included(base)
    base.extend(ClassMethods)
  end

end

class User
  include ParsingModule


  def self.start_parsing(parameters)
    user_data(parameters)
  end
end

user = '{"Personal Data": {"firstName":"Ivan","lastName":"Dobrelya"}, "Socials data":{"facebook":"http://faceebook.com","twitter":"http://twitter.com"}, "Animals":"cat"}'
User.start_parsing(user)