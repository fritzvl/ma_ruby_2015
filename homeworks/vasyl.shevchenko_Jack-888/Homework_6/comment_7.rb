class PlayersFactory #створюється клас

  def self.create_player(name, position, &block) #Cтворено метод з параметрами який повертає лямду.

    player_name = name 

    ->(own_block) do #Створено lambda-блок.
      yield
      own_block.call
      p "I'm #{player_name}, and I play as  #{position}" #Викликає лямбду з масиву "p_actions" #Виводиться З масиву дані про player_name та position
    end

  end

end


class Playground #Створюємо клас Playground


  attr_accessor :arena_name, :players #Створюємо гетери та сетери класу.

  def initialize(arena_name, player_involved) #Створюєм метод initialize.

    self.arena_name = arena_name
    self.players = []

    #Проходимо по переданному масиву з хешами.
    player_involved.each do |player|

      #Якщо знаходяться відповідні ключі то вони передаються в блок класу "PlayersFactory".
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  def call_over(actions) #Створюється метод call_over який приймає параметир actions.
    
    #Проходимо по масиву players викликаючи для кожного lambd.
    self.players.each_with_index { |player, index| player.call(actions[index]) }
  end

end

p_actions = []

#Створюєм масив з lambd.
p_actions.push -> { p "Jumps and crys" }
p_actions.push -> { p "Crys and jumps and crys" }
p_actions.push -> { p "Stands as stone" }

#Створюємо playground, та передаємо йому параметри, ім'я арени і масив хешів гравців.
playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])

#Для playground викликаємо  метод call_over і передаємо йому як параметр масив p_actions.
playground.call_over(p_actions)
