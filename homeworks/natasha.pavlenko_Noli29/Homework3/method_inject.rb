class Array

  [1,2,3,4,5].inject{|a,b| a + b}

  puts ["a", "b", "c"].inject{|a,b| a + b}

  [1,2,3,4,5].inject{|a,b| a * b}


  def sum
    self.inject{|a,b| a+b}
  end

  def product
    self.inject{|a,b| a*b}
  end

end


