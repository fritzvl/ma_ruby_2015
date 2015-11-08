class Car

 attr_accessor :color, :engine

  def make_car
    get_podveska  
    #а можно и так   get_kuzov("Серый") будет серую машину делать
    get_kuzov()      
    get_wheels
    get_engine("Форсированый")
    puts "Модель машины вышла с конвеера"
  end

  def get_podveska
    puts "Создаем подвеску."
  end

  def get_kuzov(car_color="Бежевый")
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

  def poehat
  	sceplenie
  	change_skorost
  	add_gas
  	puts "Поеееехалиии"
  end

  def sceplenie
	puts "Выжимаем сцепление"
  end

  def change_skorost
	puts "Включаем первую передачу"
  end	

  def add_gas
	puts "Жмем на педаль газа"
  end	

end



class Destroyer < Car

 attr_accessor :test

	def test_car
	poehat
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

def prokachaem_nashy_tachky
get_engine("от BMW X5")
elektrookna
muszichka("Круг - Золотые купола")
lights
puts "Мы прокачали нашу тачку"
end	

	def elektrookna
		puts "Добавляем стеклоподьемники"
	end
	

	def muszichka(car_music="Eminem - Lose yourself")
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
testing = Destroyer.new
testing.test_car
puts "==========================="
prokachka = Upgrade.new(auto)
prokachka.prokachaem_nashy_tachky

#В последнем походу не реализовал паттерн адаптер но попробовал
# нашол пример
#$search = new Search("текст", "слова");
#$searchAdapter = new SearchAdapter($search);
#echo $searchAdapter->searchWordInText();
