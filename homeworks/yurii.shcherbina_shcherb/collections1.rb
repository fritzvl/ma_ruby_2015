#creating an array
my_array = [621, 448, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 12, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 572, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 300]

# How many elements have the array?
puts "elements count = " + my_array.count.to_s

# return the reverse array
puts "reverse array:"
print my_array.reverse
puts

# max value from array
puts "Max_number = " + my_array.max.to_s

# min value from array
puts "Min_number = " + my_array.min.to_s

# arithmetical average value
sum = 0
my_array.each { |i| sum=sum+i }
puts "Arithmetical mean = #{ sum / my_array.count }"

# sort array from min value to max 
puts "Sort array"
print my_array.sort
puts

# sort array from max value to min
puts "Reverse sort array"
print my_array.sort.reverse
puts

# deleting all odd elements
# method delete_if changes original array so first of all a copy of array is creatad
puts "Only Even elements"
array2 = Array.new(my_array)
print array2.delete_if { |i| i.odd? }
puts

# another way of printing odd elements
puts "Only Even elements"
print my_array.select { |i| i.even? }
puts

# return elements wich devide by 3 without residue
puts "Divided 3"
array2 = Array.new(my_array)
print array2.delete_if { |i| i.divmod(3)[1]!=0 }
puts

# another way of previous task
puts "Divided 3"
print my_array.select { |i| i.divmod(3)[1]==0 }
puts

# return unique elements 
puts "Unique elements"
print my_array.uniq
puts

# divide each element by 10 - Rack old and return an array of float number
puts "Divided 10 - Rack old"
print my_array.map { |i| i/10.to_f }
puts

# convert the array to array of symbol using each number as a code of english alphabet character 
# (from 65 to 90 and from 97 to 122)
puts "Char array"
array2 = Array.new(my_array)
array2.delete_if { |i| (i < 65) or (i > 122) or ((i > 90) and (i < 97))}
print array2.map {|i| i.chr}
puts

# the place of min number and the place of max number are changed each other
puts "Exchanged Max and Min elements"
array2 = Array.new(my_array)
a = array2.index(array2.max)
b = array2.index(array2.min)
array2[a],array2[b]=array2[b],array2[a]
print array2
puts

# all elements before min numbers are returned
puts "All elements before Min element"
print my_array.slice(0,my_array.index(my_array.min))
puts

# the three smallest elements are returned
puts "Three Min elements"
print my_array.sort.slice(0,3)
puts
