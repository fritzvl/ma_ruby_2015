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
   include CashPayment
   make_pay :uah, :eur, :usd

   class << self 
     def make_normal_auto
        puts "Мы сделали BMW X5"
     end 
    end
end



bad_auto = AnotherCar.new
class << bad_auto
  def make_bad_auto
    puts "Мы сделали Lada Priora"
  end
end

new_class = class AnotherCar
	class << self
		self
	end
end

puts "--------------------------"
normal_auto = AnotherCar.new
normal_auto.go
AnotherCar.make_normal_auto
puts AnotherCar.new.usd
puts "--------------------------"
bad_auto.make_bad_auto
puts AnotherCar.new.uah
puts "--------------------------"
object = AnotherCar.new
puts object.class
puts new_class.class



