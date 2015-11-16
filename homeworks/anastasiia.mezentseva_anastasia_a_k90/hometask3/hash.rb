colors = {"mandarin" => 'orange',
  "strawberry" => 'red',
  "Does grape has white color?" => true
}

colors.each {|fruit, color| puts "#{color }"}

colors["peach"] = "peach"

colors.each { |x, y| puts "#{x}: #{y}" }
