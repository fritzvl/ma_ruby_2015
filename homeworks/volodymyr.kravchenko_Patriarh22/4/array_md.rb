module Array_md

  def self.load_array
    @current_array = []
    File.open("current_array.txt").each {|line| @current_array << line.split(' ')}
    @current_array.flatten!
    p 'Array was loaded from file'
    p'------------------------------------------------------'
  end

  def self.show_array
    p @current_array
  end
  
  def self.add_first_element
    @current_array.unshift(new_element)
    @current_array.flatten!
  end

  def self.add_last_element
    @current_array << new_element
    @current_array.flatten!
  end

  def self.overwrite_element
    @current_array[index] = new_element
    @current_array.flatten!
  end

  def self.delete_element
    @current_array.delete_at(index)
  end

  def self.sort_a_to_z
    @current_array.sort! {|x, y| x <=> y}
  end

  def self.sort_z_to_a
    @current_array.sort! {|x, y| y <=> x}
  end

  def self.save_array
    File.open('current_array.txt', 'w'){ |file| file.write @current_array.join(' ')}
  end

  def self.new_element
    @new_element = []
    while @new_element.size < 1 do
      p 'Enter a new element of the array:'
      @new_element = (gets.chomp).split
      p 'You entered wrong data!' if @new_element.size < 1
    end
    return @new_element
  end
    
  def self.index
    @index = ''
    while @index == '' do
      p 'Enter the array index:'
      @index = gets.chomp
      p 'You entered wrong index!' if @index == ''
    end
    return @index.to_i
  end

end
