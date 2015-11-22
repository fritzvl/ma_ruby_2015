class Car

 attr_accessor :color, :engine

  def make_car
    get_suspension
    #also you can change like this get_body("Серый") and you get more different car
    get_body()
    get_wheels
    get_engine("Форсированый")
    puts "Модель машины вышла с конвеера"
  end

  def get_suspension
    puts "Создаем подвеску."
  end

  def get_body(car_color="Бежевый")
    @color = car_color
    puts "Создаем кузов и красим его в #{color} цвет."
  end

  def get_wheels
		puts "Прикрепляем колеса"
  end

  def get_engine(car_engine="Стандартный")
  	@engine = car_engine
		puts "Устанавливаем #{engine} двигатель"
  end

  def go
  	clutch
  	change_speed
  	add_power
  	puts "Поеееехалиии"
  end

  def clutch
		puts "Выжимаем сцепление"
  end

  def change_speed
		puts "Включаем первую передачу"
  end	

  def add_power
		100
  end


	module CashPayment
  		module CashMethodes

    		def make_pay(*cash)
      			cash.each do |cash|

        			define_method cash do

          				"Вы провели оплату за машину в #{cash}"

        			end
      			end
    		end
  		end

  		def self.included(base)
    		base.extend(CashMethodes)
  		end
 	end

end



class Destroyer < Car

 attr_accessor :test

	def test_car
		go
		test("Тест")
	end

	def test(car_test)	
  		@test = car_test
	  		unless car_test.nil?
	 				puts "Тест пройден"
				else
					puts "Тест не пройден"
			end
	end		

end



class Upgrade < Car
	attr_accessor :music, :car_engine

	def initialize(car_engine)
		@engine = engine
	end

	def upgrade_our_car
		get_engine("от BMW X5")
		windows
		funny_music("Круг - Золотые купола")
		lights
		puts "Мы прокачали нашу тачку"
	end

	def windows
		puts "Добавляем стеклоподьемники"
	end
	

	def funny_music(car_music="Eminem - Lose yourself")
		@music = car_music
		puts "Ставим аудиосистему и включаем #{car_music}"
	end
	
	def lights
		"Добавляем неоновые фары"
	end	
end

auto =  Car.new
auto.make_car
puts "==========================="
#testing = Destroyer.new
#testing.test_car
#puts "==========================="
#upgrading = Upgrade.new(auto)
#upgrading.upgrade_our_car


