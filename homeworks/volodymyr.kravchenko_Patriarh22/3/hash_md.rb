module Hash_md

  def self.load_hash
    @current_hash = {}
    @current_array = []
    File.open("current_hash.txt").each {|line| @current_array << line.split(' ')}
    convert_to_hash
    p 'Hash was loaded from file'
    p'------------------------------------------------------'
  end

  def self.show_hash
    p @current_hash
  end

  def self.add_pair
    p 'Enter a hash key'
    @hash_key = get_data
    p 'Enter a hash value'
    @hash_value = get_data
    @current_hash[@hash_key] = @hash_value
  end

  def self.delete_pair
    p 'Enter a hash key'
    @current_hash.delete(get_data)
  end

  def self.sort_a_to_z
    @current_array = @current_hash.sort {|x, y| x[0] <=> y[0]}
    convert_to_hash
  end

  def self.sort_z_to_a
    @current_array = @current_hash.sort {|x, y| y[0] <=> x[0]}
    convert_to_hash
  end

  def self.save_hash
    @current_array = @current_hash.to_a.flatten
    File.open('current_hash.txt', 'w'){|file| file.write @current_array.join(' ')}
  end

  def self.convert_to_hash
    @current_hash = Hash[*@current_array.flatten]
  end

  def self.get_data
    @data = ''
    while @data.split(' ').size > 1 || @data == '' do
      @data = gets.chomp
      p 'It should be a single word' if @data.split(' ').size > 1
      p 'Can not be empty' if @data == ''
    end
    return @data
  end

end
