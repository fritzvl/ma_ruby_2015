require './Car.rb'
auto =  Car.new

class << auto
	def get_spoiler
		puts "Устанавливаем спойлер"
	end 

	def add_more_power
        a = add_power * 2
        puts "Мы усилили наш двигатель на #{a} лошадей"
    end
     
end


auto.class.class_eval do
  define_method :get_weight do
    "3500 kg"
  end
end

auto.get_spoiler
auto.add_more_power
puts "Вес машины #{auto.get_weight}"


class AnotherCar < Car
   class << self 
     def make_normal_auto
        puts "Мы сделали BMW X5"
     end
    end
end

normal_auto = AnotherCar.new
normal_auto.go
AnotherCar.make_normal_auto


bad_auto = AnotherCar.new
class << bad_auto
  def lada
    puts "Мы сделали Lada приора"
  end
end
bad_auto.lada

new_class = class AnotherCar
	class << self
		self
	end
end


object = AnotherCar.new
puts object.class
puts new_class.class



