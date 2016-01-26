load './classes.rb'

json=""
File.open('marshal_dump') {|file| json = file.read }

person = Person.new
person.from_json json

puts person.inspect