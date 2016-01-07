class House
  attr_accessor :cement, :wallpapers, :slate, :bricks
end

class BuilderHouse
  attr_reader :house

  def create
    @house = House.new
  end

  def get_house
    puts "For building house need to: 1. Cement - #{@house.cement},
                            2.Wallpapers - #{@house.wallpapers} ,
                            3.Slate - #{@house.slate} ,
                            4. Bricks - #{@house.bricks}"
  end
end

class BuilderHouseFirst < BuilderHouse
  def build_cement
    @house.cement = "124 kg"
  end

  def build_wallpapers
    @house.wallpapers = "24 pcs"
  end

  def build_slate
    @house.slate = "5 pcs"
  end

  def build_bricks
    @house.bricks = "665 pcs"
  end
end

class MultistoryBuilding < BuilderHouse
  def build_cement
    @house.cement = "130 kg"
  end

  def build_wallpapers
    @house.wallpapers = "0"
  end

  def build_slate
    @house.slate = "10 - Rack old pcs"
  end

  def build_bricks
    @house.bricks = "881 pcs"
  end
end

class Constructor
  def set_builder_house(bh)
    @builder_house = bh
  end

  def get_house
    @builder_house.get_house
  end

  def construct_house
    @builder_house.create
    @builder_house.build_cement
    @builder_house.build_wallpapers
    @builder_house.build_slate
    @builder_house.build_bricks
  end
end

constructor = Constructor.new

builder_house_first = BuilderHouseFirst.new
builder_multistory_building = MultistoryBuilding.new

constructor.set_builder_house(builder_house_first)
constructor.construct_house

puts "First house : "
puts constructor.get_house

puts "____________________________________________________"

constructor.set_builder_house(builder_multistory_building)
constructor.construct_house

puts "Multistory building: "
puts constructor.get_house