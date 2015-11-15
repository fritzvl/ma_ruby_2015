hash = {
  first_value: 111,
  second_value: 2,
  third_value: 33,
  first_text: 'Hello world!',
  second_text: 'Hello people!!!',
  third_text: 'Hi guys'
}

#The output value by key
puts hash[:second_text]

#Changing the value by key
puts hash[:third_value] = 3333

#Setting default value when there is no key
hash.default = 'You entered an invalid key. Try again'
puts hash[:hello]

#Creating a new pair of key - value
hash[:some_key] = 'Some key'

#Deletes the key-value pair
hash.delete(:third_text)

#Print the key by value
puts hash.key(3333)

#Print the length of the hash
puts hash.length
puts hash
puts '________________________________________________________________________________'

puts 'Output the Hash in format \'key => value\''
hash.each {|key, value| puts "#{key} => #{value}"}
puts '________________________________________________________________________________'

