array = [11, 5, 128, 33, 66, 5, 213, 78, 100, 33, 213, 49, 91, 11, 111, 5, 55, 123, 71]
other_array = [19, 11, 568, 2, 33, 222]

puts 'Intersection of arrays'
p array & other_array
puts '________________________________________________________________________________'

puts 'Union of sets arrays (with removed duplicates)'
p array | other_array
puts '________________________________________________________________________________'

puts 'Concatenation of arrays'
p array + other_array
puts '________________________________________________________________________________'

puts 'Array difference'
p array - other_array
puts '________________________________________________________________________________'

puts 'To divide each item on 10'
p array.collect {|item| item.to_f/10}
puts '________________________________________________________________________________'

puts 'Search of max element'
p array.max
puts '________________________________________________________________________________'

puts 'Search of min element'
p array.min
puts '________________________________________________________________________________'

puts 'Find the number of elements that are equal to the minimum'
p array.count(array.min)
puts '________________________________________________________________________________'

puts 'Remove all the odd numbers from the array (without changing the main array)'
result_array = array.dup
p result_array.delete_if {|item| item%2 != 0}
puts '________________________________________________________________________________'

puts 'Print each element of the array with adding 1000 to each element'
other_array.each {|item| puts item + 1000}
puts '________________________________________________________________________________'

puts 'Print the first five elements of the array'
p array.first(5)
puts '________________________________________________________________________________'

puts 'Print the last three elements of the array'
p array.last(3)
puts '________________________________________________________________________________'

puts 'Print all array elements after the maximum'
p other_array[other_array.index(other_array.max)+1..other_array.index(other_array.last)]
puts '________________________________________________________________________________'

puts 'Show lengths of arrays'
puts array.length
puts other_array.size
puts '________________________________________________________________________________'

puts 'Sort from highest to lowest'
p array.sort.reverse
puts '________________________________________________________________________________'

puts 'Choose items from the array that divide without remainder by 5'
p array.select {|x| x%5 == 0}
puts '________________________________________________________________________________'

puts 'Print the unique elements of the array'
p array.uniq
puts '________________________________________________________________________________'

puts 'Find five largest elements'
p array.sort.reverse[0..4]
puts '________________________________________________________________________________'

p array
p other_array
