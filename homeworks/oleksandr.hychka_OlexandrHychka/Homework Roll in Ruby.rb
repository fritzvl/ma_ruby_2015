#Class Costumer

class Costumer

   def set_name( cName )
     @costumer_name = cName
   end

   def get_name
     return @costumer_name
   end

   def set_address( cAddress )
     @costumer_address = cAddress
   end

   def get_address
     return @costumer_address
   end
end

#Create new costumer

costumer = Costumer.new
costumer.set_name( 'Tom' )
costumer.set_address( 'Street 9' )

$address = costumer.get_address

# The basic object of creation
#
class Roll
  attr_accessor :nori, :rice, :fish, :special
end

#
# class Builder
#
class BuilderRoll
  attr_reader :roll

  def create_new_roll
    @roll = Roll.new
  end

  def get_roll
    "Your order. nori: #{@roll.nori}, rice: #{@roll.rice}, fish: #{@roll.fish}, special: #{@roll.special}"
  end
end

#
#Specific types of rolls
#Roll Classic#

class Builder_Roll_Classic < BuilderRoll
  def build_nori
    @roll.nori = 'normal'
  end

  def build_rice
    @roll.rice = 'normal'
  end

  def build_fish
    @roll.fish = 'salmon fillets'
  end

  def build_special
    @roll.special = 'cucumber'
  end
end

# Roll Philadelphia

class Builder_Roll_Philadelphia < BuilderRoll
  def build_nori
    @roll.nori = 'normal'
  end

  def build_rice
    @roll.rice = 'steamed rice'
  end

  def build_fish
    @roll.fish = 'salmon fillets'
  end

  def build_special
    @roll.special = 'avocado'
  end
end

# Roll Hot

class Builder_Roll_Hot < BuilderRoll
  def build_nori
    @roll.nori = 'normal'
  end

  def build_rice
    @roll.rice = 'normal'
  end

  def build_fish
    @roll.fish = 'fillet of smoked salmon'
  end

  def build_special
    @roll.special = 'fry roll'
  end
end


# class Director

class Admin

  def set_builder_roll(br)
    @builder_roll = br
  end

  def get_roll
    @builder_roll.get_roll
  end

  def construct_roll
    @builder_roll.create_new_roll
    @builder_roll.build_nori
    @builder_roll.build_rice
    @builder_roll.build_fish
    @builder_roll.build_special
  end
end


admin = Admin.new

builder_roll_classic = Builder_Roll_Classic.new
builder_roll_philadelphia  = Builder_Roll_Philadelphia.new
builder_roll_hot  = Builder_Roll_Hot.new

admin.set_builder_roll(builder_roll_philadelphia)
admin.construct_roll

$order_is_ready = admin.get_roll

# Coruier

class Coruier
  def move
    puts 'Go to adrress ' +$address
  end

  def give_order
    puts $order_is_ready
  end
end

coruier = Coruier.new

coruier.move
coruier.give_order
