class Product
  attr_accessor :id, :name, :price, :category
end

class AddProduct
  attr_reader :product

  def create_new_product
    @product = Product.new
  end

  def get_product
    "#{@product.category}: #{@product.name} | #{@product.price}"
  end
end

class AddNewProduct < AddProduct
  def add_product_category
    @product.category = 'Diving'
  end

  def add_product_name
    @product.name = 'Flippers'
  end

  def add_product_price
    @product.price = 679.99
  end
end

class Administrator
  def set_add_product(pr)
    @add_product = pr
  end

  def get_product
    @add_product.get_product
  end

  def add_product
    @add_product.create_new_product
    @add_product.add_product_category
    @add_product.add_product_name
    @add_product.add_product_price
  end
end

admin = Administrator.new

add_flippers = AddNewProduct.new

admin.set_add_product(add_flippers)
admin.add_product

puts admin.get_product
