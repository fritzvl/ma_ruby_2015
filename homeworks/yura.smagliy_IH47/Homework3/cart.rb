class Cart

	BIG_PRICE = 1000

	attr_reader :items

	def initialize
  	@items = []
 	end

 	def add_item(item)
  	@items.push item
 	end

 	def remove_last_item
  	@items.pop
 	end

	def total_sum
		@items.map(&:price).reduce(:+)
	end

	def all_prices
		@items.map { |item| item.price }
	end

	def all_weights
		@items.map { |item| item.weight }
	end

	def items_with_price
		@items.select do |item|
			!item.price.nil? && item.price > 0
		end
	end

	def items_with_big_price
		@items.select do |item|
			item.price >= BIG_PRICE
		end
	end

	def cart_info
		puts "Cart info:"
		@items.each do |item|
			item.show_info
		end
	end

end
