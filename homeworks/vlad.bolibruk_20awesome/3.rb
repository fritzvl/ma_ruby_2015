require "rubygems"
require "json"
require "net/http"
require "uri"

uri = URI.parse("http://jsonplaceholder.typicode.com/posts")

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

if response.code == "200"
  result = JSON.parse(response.body)
  
  result.each do |doc|
    puts doc["id"] #reference properties like this
    puts doc # this is the result in object form    
    puts ""
    puts ""
  end
else
  puts "ERROR!!!"
end
