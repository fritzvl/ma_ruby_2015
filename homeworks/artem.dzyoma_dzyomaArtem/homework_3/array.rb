@array = [43, 71, 45, 87, 23, 42, 93, 201, 300, 101, 25, 300]
@add_array = [36, 4, 63, 26, 27, 11, 6]

puts "Basic array :: #{@array.join(", ")}"
puts "Additional array :: #{@add_array.join(", ")}"

puts "================================================"

puts "Length of array :: #{@array.length}"

puts "================================================"

puts "Reverse array :: #{@array.reverse.join(", ")}"

puts "================================================"

puts "Sort :: #{@array.sort { |a, b| b <=> a }.join(", ")}"

puts "================================================"

puts "Max element of array :: #{@array.max}"

puts "================================================"

puts "Min element of array :: #{@array.min}"

puts "================================================"

puts "Odd numbers :: #{@array.select(&:odd?).join(", ")}"

puts "================================================"

puts "Multiple to three :: #{@array.select { |number| number % 3 == 0 }.join(", ")}"

puts "================================================"

puts "Unique elements of array :: #{@array.uniq.join(", ")}"

puts "================================================"

puts "Three smallest elements of array :: #{@array.sort.take(3).join(", ")}"

puts "================================================"

puts "Devide on ten :: #{@array.map { |i| i / 10.0 }.join(", ")}"

puts "================================================"

puts "Concatenation of arrays :: #{(@array + @add_array).join(", ")}"

puts "================================================"

puts "Concatenation of sets arrays :: #{(@array | @add_array).join(", ")}"

puts "================================================"
