puts "Array data:"
@numeric_array_1 = [2, 3, 12, 13, 4, 9, 0 ,15, 19]
puts @numeric_array_1.join(" , ")
puts "============================================="
puts "Find the maximum value in the array:"
puts @numeric_array_1.max()

puts "============================================="
puts "Find the minimum value in the array:"
puts @numeric_array_1.min()

puts "============================================="
puts "Add a new array to previous and delete duplicate:"
@numeric_array_2 = [3, 12, 18, 0, 34]
summ_array = (@numeric_array_1+@numeric_array_2).uniq
puts summ_array.join(" , ")

puts "============================================="
puts "New array sort ascending:"
puts summ_array.sort.join(" , ")

puts "============================================="
puts "============================================="
puts "Working with hash:"
@hash_with_numbers = {a:1, b:2, c:18, d:21, ab: 13, ac: 31, ad: 81, bc: 13}
puts @hash_with_numbers.values.join(" , ")


puts "============================================="
puts "Finds the key specified value:"
puts @hash_with_numbers.key(13)
puts @hash_with_numbers.key(21)

puts "============================================="
puts "We create an array of hash keys:"
puts @hash_with_numbers.keys.join(" , ")

puts "============================================="
puts "Add a new hash:"
@hash_with_numbers_2 = {a:1, bff:2, js: 13, lqe: 41, net: 94 }
puts @hash_with_numbers.merge!(@hash_with_numbers_2).values.join(" , ")






















