module Check_user_module

  def check_user
    @users = {
      admin: "111",
      user_1: "222",
      user_2: "333"
    } 
    @user = ''
    while @user == ''
      p 'Enter user name:' 
      @user = gets.chomp
      if @users[@user.to_sym].nil? 
        @user = ''
        p 'Unknown user'
        p '------------------------------------------------------'
      else
        p '------------------------------------------------------' 
        check_password
      end
    end
  end

  def check_password
    @password = ''
    while @password == ''
      p 'Enter your password:'
      @password = gets.chomp
      if @users[@user.to_sym] == @password
        p "Wellcome, #{@user}"
        p '------------------------------------------------------'
      else
        @password = ''
        p 'Wrong password'
        p '------------------------------------------------------'
      end
    end
  end  

end
