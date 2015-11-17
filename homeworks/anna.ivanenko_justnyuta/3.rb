require 'json'
data = JSON['{
   "firstName": "Ivan",
   "lastName": "Ivanov",
   "address": {
       "streetAddress": "Gd 81 k485",
       "city": "Cherkassy",
       "postalCode": 101101
   },
   "phoneNumbers": [
       "812 123-1234",
       "916 123-4567"
   ]
}']
hash = Hash.[]
data.each do |k, v|
    hash[k] = v
end
puts hash
