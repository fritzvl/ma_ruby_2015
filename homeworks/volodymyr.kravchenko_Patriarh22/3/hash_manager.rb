require "./hash_md.rb"

class Hash_manager
  
  def self.handler
    p '------------------------------------------------------'
    Hash_md.load_hash
    @@choice = nil
    while @@choice != 'exit' do
      p 'What you want to do with the hash?'
      p '------------------------------------------------------'
      p 'load - Load hash from file'
      p 'show - Show current hash'
      p 'add - Add/Overwrite pair key-value of hash'
      p 'delete - Delete hash pair key-value by key'
      p 'sort_az - Sort hash by key from a to z'
      p 'sort_za - Sort hash by key from z to a'
      p 'save - Write a hash to file'
      p 'exit - Exit from hash block'
      p '------------------------------------------------------'
      case @@choice = gets.chomp
      when 'load'
        Hash_md.load_hash
      when 'show'
        Hash_md.show_hash
      when 'add'
        Hash_md.add_pair
      when 'delete'
        Hash_md.delete_pair
      when 'sort_az'
        Hash_md.sort_a_to_z
      when 'sort_za'
        Hash_md.sort_z_to_a
      when 'save'
       Hash_md.save_hash
      when 'exit'
        p 'Hash block complited'
      else 
        p 'You have entered the wrong keyword!'
      end
      p '------------------------------------------------------'
    end
  end

end
