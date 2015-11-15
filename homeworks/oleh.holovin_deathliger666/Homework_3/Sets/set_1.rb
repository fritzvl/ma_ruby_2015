require 'set'

class Set1

  @a_set = Set.new([1,2,4])
  @b_set = Set.new({ a: 3, b: 5})

  puts "a+b"
  puts (@a_set+@b_set).inspect
  puts "b+a"
  puts (@b_set+@a_set).inspect
  puts "a-b"
  puts (@a_set-@b_set).inspect
  puts "b-a"
  puts (@b_set-@a_set).inspect

end