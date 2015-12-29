
require 'json'

@ip = %w(192.168.1.1 172.24.1.253 10 old.90.90.90)

@iparr = @ip[0].split('.')
@iprr = @ip[2].split('.')

puts @ip[0]
puts @iparr[0]
puts @iprr[3]

puts "Type default Zyxel IP"
zy = gets.chomp
puts "Does Zte has deault IP"
zte = gets.chomp

switch = { :zyxel => zy, :zte => zte}
 puts "Zyxel default ip is #{switch[:zyxel]} , but ZTE has #{switch[:zte]}  "
switch.default = '10 old.90.90.90'
 puts "D-Link have ip looks like  #{switch[:d_link]}"

def choice_equipment(switch)
  case switch[:zyxel]
    when '192.168.1.1'
      puts "Yeah it's great equipment let's buy it"
    when '192.168.1.2'
      puts "Nope it's something terrible equipment"
    else
      if switch[:zte]
        puts "Also good switches!!!"
      else
        raise "Oups"
      end
  end
end
puts "==============="
puts "What should we do? #{choice_equipment(switch)}"
puts "==============="
puts "Convert to JSON #{switch.to_json}"