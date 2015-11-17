class Hash

  hash = {"red" => "stop", "yellow" => "wait", "green" => "go" }
  hash.each_with_index {|(key,value), i| puts "Pair #{i}: key #{key} value #{value}" }
  puts "_____________________________________"

  h1 = {"red" => "stop", "yellow" => "wait", "green" => "go" }
  puts h1.invert
  puts "_____________________________________"

  h1 = {"val1" => "key1", "val2" => "key2"}
  h2 = {"val1" => "key4", "val3" => "key3"}
  puts h1.update(h2)
  puts h1
  puts "_____________________________________"

  h = { "a" => 100, "b" => 200 }
  h.default = "Go fish"
  puts h["a"]
  puts h["z"]
end
