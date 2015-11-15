hash_new = {
  tom: 1234,
  bill: "asdf",
  tim: "qwery",
  eli: 4321,
  sam: "password"
}

puts "Display all value from hash"
hash_new.each {|key, value| puts "#{key}: #{value}"}
puts " "

puts "Display value by key"
puts hash_new[:tom]
puts " "

puts "Display key by value"
puts hash_new.key("password")
puts " "

puts "Add new value to hash"
hash_new[:ron] = "qazwsx"
hash_new.each {|key, value| puts "#{key}: #{value}"}
puts " "

puts "Delete value from hash"
hash_new.delete(:eli)
puts hash_new
puts " "

puts "Count length of the hash"
puts hash_new.length
puts " "

puts "Display max pair from hash"
puts hash_new.max
puts " "

puts "Display min pair from hash"
puts hash_new.min
puts " "

puts "Check that hash have entered key"
puts hash_new.key?(:bill)
puts " "

puts "Check that hash have entered value"
puts hash_new.value?(4040)
puts " "
