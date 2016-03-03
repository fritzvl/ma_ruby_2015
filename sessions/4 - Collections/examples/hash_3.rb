require 'json'

class ResponseParser
  def parse_response response
    JSON.parse response, symbolize_names: true
  end
end

json = '{
  "_id": "564a3aa5206905209e8b3c8d",
  "index": 0,
  "guid": "1f72bf0e-5f42-4e9e-b16c-3c8efcb8b8b8",
  "isActive": true,
  "balance": "$2,802.44",
  "picture": "http://placehold.it/32x32",
  "age": 33,
  "eyeColor": "green",
  "name": "Eve Hendricks",
  "gender": "female",
  "company": "FROLIX",
  "email": "evehendricks@frolix.com",
  "phone": "+1 (830) 413-2439",
  "address": "224 Himrod Street, Dodge, Michigan, 2906",
  "about": "Anim pariatur labore consequat eiusmod excepteur consequat ea quis cillum est officia est sunt. In nulla exercitation magna incididunt aliquip voluptate et excepteur sunt excepteur consectetur. Non veniam dolor tempor dolor exercitation ut enim dolor eu nostrud ipsum quis. Cupidatat in ut mollit amet duis officia excepteur labore ullamco ad amet ex consectetur.\r\n",
  "registered": "2015-08-11T05:17 – Search Engines:11 -03:00",
  "latitude": 18.992784,
  "longitude": 58.592569
}'

parser = ResponseParser.new

parsed = parser.parse_response json

puts '---===***  Processing parsed data  ***===---'
puts "#{parsed[:name]} is a #{parsed[:age]} years old #{parsed[:gender]}. #{(parsed[:gender] == 'make' ? 'he' : 'she').capitalize} lives at #{parsed[:address]}"
puts ''

puts '---===***  Parsed data class  ***===---'
puts parsed.class

