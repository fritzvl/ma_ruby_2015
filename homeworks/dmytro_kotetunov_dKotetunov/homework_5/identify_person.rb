require 'json'
RESPONSE = RESPONSE='{"person":{
                        "personal_data": {
                                            "name": "John Smith",
                                            "gender":"male",
                                            "age":56 } }}'
response = JSON.parse(RESPONSE)
Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do
  #create methods with ?
  def name?
     personal_data['name']
  end
 end


person = Person.new(*response["person"].values)
puts "My name is #{ person.name? }"


