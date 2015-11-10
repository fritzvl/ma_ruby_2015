class Doers
    
    def info
    puts "#{self.class}."
    end

class  Editor < Doers
attr_accessor :name, :obligations
	def initialize(name, obligations)
		@name = name
        @obligations = obligations
	end 
    def get_name 
		return @name
	end	
    def get_obligations 
		return @obligations
	end	
end

class Designer < Doers
attr_accessor :name, :obligations
	def initialize(name, obligations) 
		@name = name
		@obligations = obligations
	end 	
	def get_name 
		return @name
	end	
    def get_obligations 
		return @obligations
	end	
end

class Printer < Doers
attr_accessor :name, :obligations
	def initialize(name, obligations) 
		@name = name
		@obligations = obligations
	end 	
	def get_name 
		return @name
	end	
    def get_obligations 
		return @obligations
	end	
end

editor1 = Editor.new('Anya', 'write_and_proofread')
editor1.info
puts "My name is #{editor1.get_name}. My obligations is #{editor1.get_obligations}."
designer1 = Designer.new('Julia', 'design_and_pravki_and_makety')
designer1.info
puts "My name is #{designer1.get_name}. My obligations is #{designer1.get_obligations}."
printer1 = Printer.new('Valya', 'print_and_send')
printer1.info
puts "My name is #{printer1.get_name}. My obligations is #{printer1.get_obligations}."
end
