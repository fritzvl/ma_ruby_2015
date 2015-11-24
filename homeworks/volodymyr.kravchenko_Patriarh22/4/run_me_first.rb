require "./array_manager.rb"
require "./hash_manager.rb"
require "./check_user_module.rb"

class Manager
  
  def self.choice
    @@choice = nil
    while @@choice != 'exit' do
      p 'What block you want to invoke?'
      p '------------------------------------------------------'
      p 'array - Enter to the array block'
      p 'hash - Enter to the hash block'
      p 'exit - Leave the program'
      p '------------------------------------------------------'
      case @@choice = gets.chomp
      when 'array'
        Array_manager.handler
      when 'hash'
        Hash_manager.handler
      when 'exit'
        p 'The program finished its work'
      else 
        p 'You have entered the wrong keyword!'
      end
      p '------------------------------------------------------'
    end
  end

end

Manager.class_eval do
  extend Check_user_module
  self.check_user
end

=begin
"We can do the same thing in another way:"

class << Manager
  include Check_user_module
  Manager.check_user
end
=end

Manager.choice
