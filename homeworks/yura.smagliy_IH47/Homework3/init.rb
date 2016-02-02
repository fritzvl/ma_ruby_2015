require_relative "cart"
require_relative "item"

cart = Cart.new

item1 = Item.new(price: 10, weight: 20)
item2 = Item.new(weight: 100)
item3 = Item.new({price: 1000, weight: 100})
item4 = Item.new(price: 20000, weight: 100)

cart.add_item(item1)
cart.add_item(item2)
cart.add_item(item3)
cart.add_item(item4)

cart.cart_info

p "Total price of all items: #{cart.total_sum}"
p "All prices: #{cart.all_prices}"
p "All weights:  #{cart.all_weights}"
p "Number of items with price: #{cart.items_with_price.count}"
p "Number of items with big price: #{cart.items_with_big_price.count}"

puts "Remove last item..."
cart.remove_last_item

cart.cart_info
