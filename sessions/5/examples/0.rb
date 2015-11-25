class Pet

  attr_accessor :name

  def voice
    raise NotImplementedError
  end

end

class Cat < Pet

  def voice
    "Meow"
  end

end

class Pig < Pet

end

puts "Cat says: #{Cat.new.voice}"
puts "Dog says: #{Pig.new.voice}"