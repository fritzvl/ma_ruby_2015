class PlayersFactory #Створюємо класс PlayersFactory

  #створюємо метод классу create_player з параметрами name, position і передаємо туди блок
  def self.create_player(name, position, &block)

    player_name = name # присвоюэмо змінній player_name вхідний параметр name

    ->(own_block) do #створюємо лямбду з назвою own_block
      yield # для виклику блока, переданного методу використовується yield
      own_block.call #викиликаємо лямбду на виконання
      # виводимо в консоль строку з параметрами методу використовуючи інтерполяцію строки
      p "I'm #{player_name}, and I play as  #{position}"
    end

  end

end

# Створюємо класс Playground
class Playground

  # створюємо геттери і сетттери для внутрішніх змінних класу :arena_name, :players
  attr_accessor :arena_name, :players

  #ініціюєм через метод інстанса initialize, передаємо в метод параметри arena_name, player_involved
  def initialize(arena_name, player_involved)

    self.arena_name = arena_name #присвоюємо змінній інстанса параметр arena_name
    self.players = []            #присвоюємо змінній інстанса пустий массив
    player_involved.each do |player|
      #заповнюємо змінну player_involved за допомогою блоку значеннями player[:name], player[:position]
      #виводимо в консоль строку "I`m glad to play on  + arena_name" якщо змінна player має ключі name і position
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  def call_over(actions)
    #створюємо метод call_over з параметром actions
    #викликаємо ітератор each_with_index для обьекта players.
    self.players.each_with_index { |player, index| player.call(actions[index]) }
  end

end
#створюємо пустий массив p_actions
p_actions = []
#додаємо до масиву три строки
p_actions.push -> { p "Jumps and crys" }
p_actions.push -> { p "Crys and jumps and crys" }
p_actions.push -> { p "Stands as stone" }
# в змінну playground передаємо обькт классу Playground
playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])
#Викликаємо метод call_over з параметром p_actions
playground.call_over(p_actions)