require 'json'

RESPONSE = '{"person":{"personal_data":{"name":"John Smith", "gender":"male", "age":18}, "address":{"сountry":"ukraine", "city":"сherkasy", "street":"shevchenka", "house":"205"}, "social_profiles":["http://facebook.com","http://twitter.com","http://vk.com"],"additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"cat"},{"name":"Baloon","species":"dog"}]}}}'


pars = JSON.parse(RESPONSE)


module Info

  module InfoMethods

    def info_methods

      define_method :address do
        puts address.size
      end


      define_method :social_profiles_size do
        puts social_profiles.size
      end

      define_method :adult? do
        personal_data['age'] < 18
      end

      define_method :get_dog_name do
        additional_info["pets"].find {|i| i["species"] == "dog"}["name"]
      end

      define_method  :vk_account do
        social_profiles.join.scan(/vk.ru/).any?
      end
      define_method  :tv_account do
        social_profiles.join.scan(/twitter.com/).any?
      end

      define_method  :fb_account do
        social_profiles.join.scan(/facebook.com/).any?
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
puts "Does she adult?"
puts human.adult?
puts "What's name of doc:"
puts human.get_doc_name
puts "Does she have account in vk?"
puts human.vk_account
puts "Does she have account in fb?"
puts human.fb_account
puts "Last register in":
  puts human.social_profiles.last
