#namespace rb MyAuth
#namespace py myauth
#
#struct User {
#  1: string username,
#            2: string password
#}
#
#enum LoginStatus {
#  SUCCESS,
#      FAIL
#}
#
#service Authentication {
#  string say_hello(),
#         LoginStatus login(1:User cred)
#}

#======SERVER=========

require 'thrift'
$:.push('gen-rb')

require 'Authentication'
require 'myauth_constants'

class AuthenticationHandler
  def say_hello
    puts "thrift client connected"
    "hello thrift client"
  end

  def login cred
    if cred.username == 'hello' && cred.password == 'world'
      puts "logged in"
      return MyAuth::LoginStatus::SUCCESS
    end

    puts "great pie of fail"
    MyAuth::LoginStatus::FAIL
  end
end

handler = AuthenticationHandler.new
processor = MyAuth::Authentication::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts "Starting the server..."
server.serve()
puts "done."


#========CLIENT=========

require 'thrift'
$:.push('gen-rb')

require 'Authentication'
require 'myauth_constants'

transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', 9090))
protocol = Thrift::BinaryProtocol.new(transport)
auth = MyAuth::Authentication::Client.new(protocol)
transport.open()

puts auth.say_hello()

user = MyAuth::User.new
user.username = 'hello'
user.password = 'world'

puts "Login: #{auth.login(user)}"

user2 = MyAuth::User.new
user2.username = 'failed'
user2.password = 'world'

puts "Login: #{auth.login(user2)}"