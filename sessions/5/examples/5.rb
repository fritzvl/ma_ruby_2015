class Cat
  attr_accessor :name
  def eigenclass
    class << self
      self
    end
  end
end

tom = Cat.new

def tom.voice
  "Meow"
end

tom.class.class_eval do
  define_method :weight do
    "5 kg"
  end
end

puts "Tom says: #{tom.voice}"
puts "Tom weight is: #{tom.weight}"
puts "Tom's ID : #{tom.class.object_id}"

mike = Cat.new
class << mike
  def voice
    "Meeeeeoooowww"
  end
end

puts "Mike says :#{mike.voice}"
puts "Mike's ID#{mike.class.object_id}"
puts "Tom answers :#{tom.voice}"

puts "Tom eigenclass ID: #{tom.eigenclass.object_id}"
puts "Tom class ID: #{tom.class.object_id}"
puts "Mike eigenclass ID: #{mike.eigenclass.object_id}"