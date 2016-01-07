RESPONSE="asdfasdfasfasdfqwefwqef"


class UserFactory

  def self.create_user(response)

    user = UserBuilder.new

    unless response["person"].nil?

      response["personal_data"].each_key do |k,v|

        user.build(const_get("#{k}Builder"),v)

      end

    end

    user.create_user

  end

end


class PersonBuilder

  def build(profile)

    result =  Struct::Person.new(profile)



  end

end

class SocialBuilder

end

class UserBuilder

  def build(partial_builder, data)
    partial_builder.build(data)

  end


end







class AnotherBuilder

  MATRIX={"person" => PersonBuilder, "social_profiles" => SocialBuilder}

def build(key, value)
  MATRIX[key].build(value)

end


end



















