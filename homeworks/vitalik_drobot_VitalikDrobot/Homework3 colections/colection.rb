  require 'json'

  user_information = '{
    "name":"James",
    "family_name":"Bond",
    "card": "MasterCard",
    "number_curd":"52175632789645230",
    "pin": 4682,
    "login":"qwerty"
  }' #JSON
  puts "please enter you login (test login qwerty)"
  user_login = gets.chomp

  puts "enter you password (test password qwerty)"
  user_password = gets.chomp

  information_hash = JSON.parse(user_information)# Json convert to hash
  if user_login == information_hash["login"] && user_password == information_hash["password"]
    puts "You personal information:"
    puts information_hash
    puts information_hash.class

  else
    puts "Your password or username is incorrect!"
  end
