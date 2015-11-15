class Hash1

  cars1 = Hash.new

  cars1[1] = "Audi"
  cars1[2] = "Mercedes"

  cars2 = Hash.new

  cars2[3] = "Subaru"
  cars2[4] = "Honda"

  cars = cars1.merge cars2
  puts cars
  puts cars1

  cars = cars1.merge! cars2
  puts cars
  puts cars1

end
