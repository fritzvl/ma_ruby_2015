class Array2

  @a = [1, 2, 3, 4, 5]
  @b = [4, 5, 6, 7, 8]

  union = @a | @b
  isect = @a & @b
  diff1  = @a - @b
  diff2  = @a - @b
  sdiff = (@a - @b) | (@b - @a)

  puts "Union of arrays: #{union}"
  puts "Intersection of arrays: #{isect}"
  puts "Difference of arrays A - B: #{diff1}"
  puts "Difference of arrays B - A: #{diff2}"    
  puts "Symmetric difference of arrays: #{sdiff}" 

end
