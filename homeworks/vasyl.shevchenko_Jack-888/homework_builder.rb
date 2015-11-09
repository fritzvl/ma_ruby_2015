class Clothes 

  def sew_сlothes
    get_type_clothing() 
    get_clothing_material     
    get_widi_making
    get_pattern
		get_price
    puts "Одяг пошито"
  end

  def get_type_clothing
    puts "Вибираєм вид одягу"
  end

  def get_clothing_material
    puts "Вибираєм матеріал"
  end

  def get_widi_making
		puts "Вид пошиву"
  end
		
  def get_pattern
    puts "Наклеюїмо візирунок"
  end

	def get_price
		puts "Ціна:"
	end
	
	def get_add_your_pocket
		puts "Добавим карман"
	end
	
	def get_add_logo
		puts "Наклеюїм логотип"	
	end

end

class Add < Clothes

	def modification_сlothes
		get_add_your_pocket
		get_add_logo
 		get_price_modifications
		puts "Модифікація виконана +++"
	end

	def	get_price_modifications
		puts "Оновлена ціна:"
	end
end




clothes =  Clothes.new
clothes.sew_сlothes
puts "+++++++модифікація++++++++++++++++++"
modifications = Add.new
modifications.modification_сlothes
puts 

