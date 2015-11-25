class Array
  array = [1, 2, 3, 5, 4]

  puts "Size of the array =  #{array.size}"
  puts "The length of the array =  #{array.length}"
  puts "First element = #{array.shift}"
  puts "Last element = #{array.pop}"
  puts "____________________________________________"

  puts "Multiplication table"
  10.times do |x|
    10.times do |y|
      print  "%5d" % [ (x+1) * (y+1) ]
    end
    puts
  end



end
