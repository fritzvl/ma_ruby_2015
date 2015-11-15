class Car
  attr_accessor :engine, :body, :chassis_system, :cabin, :voice_command
end

class BuilderCar
  attr_reader :car

  def creat_new_car
    @car = Car.new
  end

  def get_car
    puts "A new car with such characteristics: engine: #{@car.engine}, body: #{@car.body}, chassis_system #{@car.chassis_system}, cabin: #{@car.cabin}, voice_command: #{@car.voice_command}"
  end
end

class BuilderCarBmw < BuilderCar
  def build_engine
    @car.engine = "Bmw engine 4 liter"
  end

  def build_body
    @car.body = "Sedan"
  end

  def build_chassis_system
    @car.chassis_system = "4x4"
  end

  def build_cabin
    @car.cabin = "Alcantare style"
  end

  def build_voice_command
    @car.voice_command = "BMW Start"
  end
end

class BuilderCarBmwChinaStyle < BuilderCar
  def build_engine
    @car.engine = "China engine 3.5 liter"
  end

  def build_body
    @car.body = "Sedan"
  end

  def build_chassis_system
    @car.chassis_system = "2x4"
  end

  def build_cabin
    @car.cabin = "Cotton style cabin"
  end

  def build_voice_command
    @car.voice_command = "BMW china style Start"
  end
end

#Створюю нове третє авто з голосовим запуско як у оригінала BMW "BMW Start"

class BuilderCarBmwChinaStyleMod < BuilderCarBmwChinaStyle
  def build_voice_command
    super
    @car.voice_command = "BMW Start"
  end
end

class Robot
  def print_builder_car(bcar)
    @builder_car = bcar
  end

  def get_car
    @builder_car.get_car
  end

  def construct_car
    @builder_car.creat_new_car
    @builder_car.build_engine
    @builder_car.build_body
    @builder_car.build_chassis_system
    @builder_car.build_cabin
    @builder_car.build_voice_command

  end
end

robot = Robot.new

builder_car_BMW = BuilderCarBmw.new
builder_car_BMW_China = BuilderCarBmwChinaStyle.new
builder_car_BMW_China_Mod = BuilderCarBmwChinaStyleMod.new

robot.print_builder_car(builder_car_BMW)
robot.construct_car
puts robot.get_car

robot.print_builder_car(builder_car_BMW_China)
robot.construct_car
puts robot.get_car

robot.print_builder_car(builder_car_BMW_China_Mod)
robot.construct_car
puts robot.get_car

