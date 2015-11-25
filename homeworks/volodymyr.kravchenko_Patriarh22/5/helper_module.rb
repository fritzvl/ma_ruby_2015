module Helper
  module ClassMethods   
    def name?
     check_personal_data('name')
    end

    def gender?
      check_personal_data('personal_data')
    end

    def age?
      check_personal_data('age')
    end

    def facebook?
      @usual_social_networks = []
      check_social_networks('facebook.com')
    end

    def instagram?
      check_social_networks('instagram.com')
    end

    def twitter?
      check_social_networks('twitter.com')
    end

    def other_social_networks?
      @other_social_networks = []
      @other_social_networks = @person.social_profiles - @usual_social_networks
      if @other_social_networks.size > 0
         return true
      else
         return false
      end
    end

    def hobby?
      check_additional_info('hobby')
    end

    def pets?
      pets_separation if check_additional_info('pets')
    end

    def cat?
      @cats.empty? ? false : true
    end

    def dog?
      @dogs.empty? ? false : true
    end

    def exotic?
      @exotic.empty? ? false : true
    end

    def check_personal_data(data)
      @person.personal_data[data].nil? ? false : true
    end

    def check_additional_info(data)
      @person.additional_info[data].nil? ? false : true
    end

    def check_social_networks(social_network)
      network_exist = false
      @social_network = ''
      @person.social_profiles.each do |profile|
        if profile.include? social_network
          @social_network = profile
          @usual_social_networks << @social_network
          network_exist = true
        end 
      end
      return network_exist
    end
  
    def pets_separation
      @dogs = []
      @cats = []
      @exotic = []
      @person.additional_info['pets'].each do |pet|
          if pet['species'] == 'dog'
            @dogs << pet['name']
          elsif pet['species'] == 'cat'
            @cats << pet['name']
          else
            @exotic << pet
          end
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
