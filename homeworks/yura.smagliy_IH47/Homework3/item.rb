class Item

	attr_accessor :price
	attr_reader :weight

	def initialize(options = {})
		@price = options[:price] ? options[:price] : 0
	 	@weight = options[:weight] ? options[:weight] : 0
	end

	def show_info
		puts "Item - price: #{@price}, weight: #{@weight}"
	end

end
