colours = {
  1 => 'red',
  2 => 'blue',
  3 => 'yellow',
  4 => 'green',
  5 => 'orange',
  6 => 'purple'
}

puts "========================================="

puts "Basic hash:"
colours.each { |key, value| puts "#{key}: #{value}" }

puts "========================================="

puts "Length of hash: #{colours.length}"

puts "========================================="

colours.default = "The specified key is not found!"
puts colours[31]

puts "========================================="

puts "- Added new colours -"
colours[7] = 'gray'
colours[8] = 'white'
colours[9] = 'black'
puts "#{colours.values.join(", ")}"

puts "========================================="

puts colours.values_at(1, 9)

puts "========================================="

colours.clear
puts "New length of hash: #{colours.length}"
puts "Empty? #{colours.empty?}"

puts "========================================="
