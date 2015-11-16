require "./array_md.rb"

class Array_manager
  
  def self.handler
    p '------------------------------------------------------'
    Array_md.load_array
    @@choice = nil
    while @@choice != 'exit' do
      p 'What you want to do with the array?'
      p '------------------------------------------------------'
      p 'load - Load array from file'
      p 'show - Show current array'
      p 'first - Add an element to the beginning of the array'
      p 'last - Add an element to the end of the array'
      p 'over - Overwrite an element of the array by index'
      p 'delete - Delete an element of the array by index'
      p 'sort_az - Sort array elements from a to z'
      p 'sort_za - Sort array elements from a to a'
      p 'save - Write an array to file'
      p 'exit - Exit from array block'
      p '------------------------------------------------------'
      case @@choice = gets.chomp
      when 'load'
        Array_md.load_array
      when 'show'
        Array_md.show_array
      when 'first'
        Array_md.add_first_element
      when 'last'
        Array_md.add_last_element
      when 'over'
        Array_md.overwrite_element
      when 'delete'
        Array_md.delete_element
      when 'sort_az'
        Array_md.sort_a_to_z
      when 'sort_za'
        Array_md.sort_z_to_a
      when 'save'
       Array_md.save_array
      when 'exit'
        p 'Array block complited'
      else 
        p 'You have entered the wrong keyword!'
      end
      p '------------------------------------------------------'
    end
  end

end
