hash1 = { a: "abc", b: 777, c: "asddas", d: "word", e: 1505 }

puts "Display all value from hash"
hash1.each do |k, v|
  puts "#{k}: #{v}"
end

puts "Display value by key"
puts hash1[:a]

puts "Display key by value"
puts hash1.key(777)

puts "Add new value to hash"
hash1[:f] = "new"
hash1.each do |k, v|
  puts "#{k}: #{v}"
end

puts "Delete value from hash"
hash1.delete(:c)
puts hash1

puts "Count length of the hash"
puts hash1.length

puts "Check that hash have entered key"
puts hash1.key?(:d)

puts "Check that hash have entered value"
puts hash1.value?("word")

puts "Display min pair from hash"
puts hash1.min

puts "Display max pair from hash"
puts hash1.max
