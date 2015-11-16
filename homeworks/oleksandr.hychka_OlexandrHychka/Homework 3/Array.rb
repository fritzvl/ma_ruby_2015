array_first = [1, 12, 23, 564, 34, 123]
array_second = [566, 45, 26, 34, 1, 12, 123, 57, 26]
array_third = [[23, 14, 43],"test", "ruby", 12]

puts " "
puts "Display array"
p array_first
puts " "
puts "Display value selected by index"
p array_third[0][1]
puts " "
puts "Display range of value"
p array_third[0..2]
puts " "
puts "Intersection of arrays"
p array_first & array_second
puts " "
puts "Array difference"
p array_first - array_second
puts " "
puts "Union of arrays"
p array_first + array_second
puts " "
puts "Multiplying by two"
p array_second.map{|value| value*2}
puts " "
puts "Display max value from array"
p array_first.max
puts " "
puts "Display min value from array"
p array_first.min
puts ""
puts "Display uniq value"
p array_second.uniq
puts " "
puts "Sort array in ascending order"
p array_second.sort
puts " "
puts "Sort array in discending order"
p array_second.sort.reverse
puts " "
puts "Display lengths of arrays"
p array_third.length
puts " "
puts "Add value to the array"
p array_third << "Push"
puts " "
