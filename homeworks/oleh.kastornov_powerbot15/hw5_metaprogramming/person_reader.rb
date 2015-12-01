require 'json'

PROBABLY_PERSON = JSON.parse( IO.read('./response.json') )

class PersonInfoGetter

  def self.person_analise
    if PROBABLY_PERSON['person']
      p "********* Person Response ************"
      PROBABLY_PERSON['person'].each do |key, value|
        class_name = key.split('_').collect(&:capitalize).join
        if class_exists?("#{class_name}")
          const_get("#{class_name}").send(key, value)
        else
          p "Unknown data field **#{key}**"
          p "    Contains: #{value}"
        end
      end
    else
      p 'Not a person'
    end

  end

  def self.class_exists?(class_name)
    class_to_check = Module.const_get(class_name)
    return class_to_check.is_a?(Class)
  rescue NameError
    return false
  end

end

class PersonalData
  def self.personal_data(data)
    p 'Personal Info : '
    data.each do |key, value|
      p "    #{key} : #{value}"
    end
  end
end

class SocialProfiles
  def self.social_profiles(data)
    p 'Social profiles : '
    data.each_with_index do |profile, i|
      p "    #{i + 1} - #{profile}"
    end
  end
end


PersonInfoGetter.person_analise

