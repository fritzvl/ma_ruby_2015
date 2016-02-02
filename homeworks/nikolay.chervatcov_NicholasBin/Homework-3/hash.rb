hash_1={color1: "red", color2: "green", color3: "blue", color4: "yellow", color5: "gray"}
puts hash_1.values.join ","

puts "================================================================="

hash_1["color6"] = "white"
puts hash_1.values.join ","

puts "================================================================="

hash_2={color6: "white"; color7: "brown"; color8: "black"}
puts hash_1.update(hash_2)
puts hash_1
puts "Length of hash: #{hash_1.length}"

puts "================================================================="

hash_1.default = "The specified key is not found!"
puts hash_1[world]
