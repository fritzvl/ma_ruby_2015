load './classes.rb'

person = Person.new
person.name="bob"
person.age=22
person.awesome=true
puts person.to_json


File.open('./marshal_dump', 'w') { |file| file.write person.to_json }
