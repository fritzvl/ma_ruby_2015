class Customer

attr_reader :order_id, :name, :adress, :e_mail, :phone_number

def initialize(id , name , adress, e_mail, phone_number)
		@order_id = id
		@name = name
		@adress = adress
		@e_mail = e_mail
		@phone_number = phone_number
		puts "Зберегли дані замовника"
		puts "--------------------------------"
		
end

end


class Order

attr_reader :order_id, :order_hash

def initialize(id, order_array)
		@order_id = id
		@order_hash = Hash.new
		order_array.each do |key, value|
		@order_hash[key] = value
		end
		puts "Записали замовлення"
		puts "--------------------------------"
end

end


class Handler

attr_reader :order_id, :order_hash, :cost

def initialize(object)
@order_hash = object.order_hash
end

def split_hash
	@kitchen_hash = Hash.new
	@bar_hash = Hash.new
	@cost = 0
	@order_hash.each do |key, value|
	case key
	when "burrito"
	@kitchen_hash[key] = value
	@cost += 25*value
	when "hot dog"
	@kitchen_hash[key] = value
	@cost += 20*value
	when "donut"
	@kitchen_hash[key] = value
	@cost += 10*value
	when "cola"
	@bar_hash[key] = value
	@cost += 10*value
	when "coffee"
	@bar_hash[key] = value
	@cost += 8*value
	when "hlyntveyn"
	@bar_hash[key] = value
	@cost += 12*value
	end
	end
end

def show_order
	unless @kitchen_hash.nil? then
	puts "Замовлення по кухні:"
	@kitchen_hash.each do |key, value|
	puts "Приготувати #{value} #{key}"
	end
	puts "--------------------------------"
	end
	unless @bar_hash.nil? then
	puts "Замовлення по бару:"
	@bar_hash.each do |key, value|
	puts "Приготувати #{value} #{key}"
	end
	puts "--------------------------------"
	end
end

end


class Courier

def initialize(object, cost)
@object = object
@cost = cost
end

def send_courier
puts "Відправити кур'єра:"
puts "Номер замовлення: #{@object.order_id}"
puts "Адреса: #{@object.adress}"
puts "Замовник: #{@object.name}"
puts "Номер телефону: #{@object.phone_number}"
puts "Вартість замовлення: #{@cost} грн."
end

end


class Manager

def new_order
	customer = Customer.new(1, "Кравченко Володимир", "Cміла, вул.Леніна 123", "kvs-smela@yandex.ua", "0731234567")
	order = Order.new(1, [["burrito", 2], ["cola", 2], ["hot dog", 1], ["coffee", 1]])
	handler = Handler.new(order)
	handler.split_hash
	handler.show_order
	courier = Courier.new(customer, handler.cost)
	courier.send_courier
end

end

manager = Manager.new
manager.new_order
