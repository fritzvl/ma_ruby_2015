class Coupon
  attr_accessor :value, :id, :emission_id

  def initialize(emission_id, value)
    @emission_id = emission_id
    self.set_value(value)
  end

  def get_value
    @value
  end

  def set_value(value)
    @value = value
  end

  def save!
    puts "Coupon #@value stored to the database"
  end

end

class Emission
  attr_accessor :coupons, :id, :company_id, :coupon_counter, :new_coupon, :restrictions
  def initialize(company_id, restrictions)
    @company_id = company_id
    @restrictions = restrictions
    self.save!
  end

  def create_coupons
    puts "Coupons are generating now"
    @coupons = []
    @coupon_counter = 0
    while @coupon_counter <= 5
      @new_coupon = Coupon.new(@id, "EWEWRRWSDD")
      if (self.coupon_allowed_to_save?(@new_coupon.get_value))

        @new_coupon.save!
        @coupons.push(@new_coupon)
      end
      @coupon_counter += 1
    end
  end

  def coupon_allowed_to_save?(coupon_value)
    true
  end

  def get_coupons
    puts "Stored coupons are:"
    @coupons
  end

  def save!
    puts "Emission stored to the database"
  end

end

class Company
  attr_accessor :name, :id, :emissions

  def initialize(company_name)
    @name = company_name
    @emssions = Array.new
    @id = 1
  end

  def get_id
    @id
  end

  def save!
    puts "Company #@name saved!"
  end
end

class GeneratorController
  attr_accessor :company, :company_id, :emission

  def create_company(name)
    @company = Company.new(name)
    @company_id = @company.get_id
    @company.save!
  end

  def get_company
    @company
  end

  def generate_coupons(company_id)
    @emission = Emission.new(company_id, "Some restrictions")
    @emission.create_coupons
    puts @emission.get_coupons
  end

end

generator = GeneratorController.new

generator.create_company("Awesome company")

generator.generate_coupons(generator.get_company.get_id)




