class Product 
  attr_accessor :material, :sample, :weight, :price   
end

class BuilderProduct
  attr_reader :product
  
  def create_new_product
    @product = Product.new
  end
  
  def get_product
    "Manufactured material: #{@product.material}, sample: #{@product.sample}, weight: #{@product.weight}, price: #{@product.price}"
  
  end
end

class BuilderProductRing < BuilderProduct
  
  def build_material
    @product.material = 'Gold'  
  end
  
  def build_sample
    @product.sample = '925'
  end
  
  def build_weight
    @product.weight = '12g.'
  end
  
  def build_price
    @product.price = '800grv.'
  end
  
end

class BuilderProductBracelet < BuilderProduct
  
  def build_material
    @product.material = 'Silver'  
  end
  
  def build_sample
    @product.sample = '875'
  end
  
  def build_weight
    @product.weight = '35g.'
  end
  
  def build_price
    @product.price = '735grv.'
  end
  
end

class Manufacturer
  
  def set_builder_product(bp)
    @builder_product = bp
  end
  
  def get_product
    @builder_product.get_product
  end

  def works_product
    @builder_product.create_new_product
    @builder_product.build_material
    @builder_product.build_sample
    @builder_product.build_weight
    @builder_product.build_price
  end  
  
end

manufacturer = Manufacturer.new

builder_product_ring = BuilderProductRing.new
builder_product_bracelet = BuilderProductBracelet.new

manufacturer.set_builder_product(builder_product_ring)
manufacturer.works_product

puts "Ring : "
puts manufacturer.get_product

puts "================================================="

manufacturer.set_builder_product(builder_product_bracelet)
manufacturer.works_product

puts "Bracelet : "
puts manufacturer.get_product
