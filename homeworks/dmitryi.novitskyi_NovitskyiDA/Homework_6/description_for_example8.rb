#Клас PlayerFactory:
class PlayersFactory

  #Маємо метод create_player, який приймає такі аргументи: ім'я, позицію, блок.
  def self.create_player(name, position, &block)

    #Змінній player_name просвоюємо ім'я гравця.
    player_name = name

    #Створюємо lambda-блок, який має аргумент own_block.
    ->(own_block) do

      #Викликаємо блок, який отримали як аргумент метода.
      yield

      #Викликаємо блок, який отримали як аргумент нашого lambda-блоку.
      own_block.call

      #Виводимо на екран: "Я (Ім'я гравця) і я граю як (Позиція гравця)"
      p "I'm #{player_name}, and I play as  #{position}"
    end

  end

end

#Клас Playground:
class Playground

  #Створюємо геттери і сеттери для наших полів класу :arena_name і :players.
  attr_accessor :arena_name, :players

  #Маэмо метод initialise для ініціалізації інстансу класу Playground, який приймає 2 параметри: arena_name і player_involved.
  def initialize(arena_name, player_involved)

    #Змінній класу arena_name присвоюємо значення параметра arena_name.
    self.arena_name = arena_name

    #Змінній класу players присвоюємо пустий масив.
    self.players = []

    #Перебираємо кожний елемент масиву player_involved, який отримали як параметр метода initialize.
    player_involved.each do |player| # Позначаємо кожний елемент як player.

      #Якщо цей елемент player має ключ :name і ключ :position, то
      #методом push додаємо до масиву players гравця, як lambda-об'єкт, який створюється
      #за допомогою методу create_player класу PlayersFactory, якому передаються 3 параметри:
      #значення ключа :name, значення ключа :position і блок, який виводить на екран:
      #"Я радий грати на (Ім'я арени)".
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  #Метод call_over приймає один параметр actions.
  def call_over(actions)
    #Перебираємо кожний елемент масиву players разом з його індексом.
    #Позначаємо кожний елемент як player, індекс як index.
    #Цей кожний елемент є lambda-об'єктом,тому для нього визиваємо метод call,
    #який приймає як параметр інший lambda-об'єкт з масиву actions з індексом нинішнього елемента player.
    self.players.each_with_index { |player, index| player.call(actions[index]) }
  end

end

#Створюємо пустий масив p_actions.
p_actions = []

#Додаємо в нього lambda-об'єкт, який виводить на єкран: "Jumps and crys"
p_actions.push -> { p "Jumps and crys" }
#Додаємо в нього ще один lambda-об'єкт, який виводить на єкран: "Crys and jumps and crys"
p_actions.push -> { p "Crys and jumps and crys" }
#Додаємо в нього ще один lambda-об'єкт, який виводить на єкран: "Stands as stone"
p_actions.push -> { p "Stands as stone" }

#Створюємо інстанс класу Playground, передаючи йому, як параметри, ім'я арени і масив хешів гравців.
playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])

#Викликаємо для цього інстансу метод call_over і передаємо йому як параметр масив p_actions.
playground.call_over(p_actions)

