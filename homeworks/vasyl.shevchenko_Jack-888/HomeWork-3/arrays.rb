@array1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9,]

@array2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9,]

@array_rand = []
  i = 0
  while i <= 10
    @array_rand << rand(10)
    i += 1
  end

puts "All array"
  puts "Array №1", @array1.join
  puts ""
  puts "Array №2", @array2.join
  puts ""
  puts "Array №3", @array_rand.join

puts "=========================="

  puts "All items except the last 5"
  puts @array1[0...-5].join
  puts @array2[0...-5].join
  puts @array_rand[0...-5].join

puts "=========================="

  puts "Combining two arrays"
  puts @array1.join + @array2.join


puts "=========================="

  puts "Remove Duplicates"
  puts @array1 | @array2

puts "=========================="

  puts "Combination"
  puts @array1 .combination(1).to_a.join
  puts @array1 .combination(2).to_a.join

puts "=========================="

  puts "Reverse"
  puts @array1.reverse.join
  puts @array2.reverse.join
  puts @array_rand.reverse.join

puts "=========================="
  puts @array_rand.sort!.join

puts "=========================="

  puts "Dalete_if <5, <=8"
  puts @array1.delete_if {|array1| array1 < 5 }.join
  puts @array2.delete_if {|array2| array2 <= 8 }.join
