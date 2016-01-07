array1 = [600,14,5,64,11,2]

def maxmin(array1)
  v = array1.shift
  if array1.empty?
    return v, v
  end

  max, min = maxmin(array1)
  return v > max ? v : max, v < min ? v : min
end

max, min = maxmin(array1)
puts "min = #{min}, max = #{max}"
