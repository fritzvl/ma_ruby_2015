class PlayersFactory #Створюємо class PlayersFactory

  def self.create_player(name, position, &block) #створюємо метод self.create_player з аргументами (name, position, &block)

    player_name = name #Присвоюємо player_name = name

    ->(own_block) do #створюэмо лямбду
      yield #викликаємо блок
      own_block.call #визиваємо own_block
      p "I'm #{player_name}, and I play as  #{position}" #вивід рядка "Я такий то гравець, і граю на такій то позиції"
    end

  end

end

class Playground #створюємо клас Playground


  attr_accessor :arena_name, :players #приватний метод, який створює set- и get- методи для наступних атрибутов екзампляра класа

  def initialize(arena_name, player_involved) #ініціюємо методи arena_name, player_involved

    self.arena_name = arena_name # присвоюємо методу класа arena_name = arena_name
    self.players = [] #методу класу players ствоюємо пустий масив
    player_involved.each do |player| #для кожного player, який грає, створюється масив з name and position, виводить рядок "Я радий грати на такій то арені ", якщо у player є key "name" and key "position"
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  def call_over(actions) #створюємо метод call_over з аргументом actions
    self.players.each_with_index { |player, index| player.call(actions[index]) }
    #для кожного players викликається блок з 2 аргументами -   самим елементом player та його index,
    #визивається actions з index гравця
  end

end

p_actions = [] #методу p_actions ствоюємо пустий масив

p_actions.push -> { p "Jumps and crys" }
p_actions.push -> { p "Crys and jumps and crys" } #створюються лямбди з рядками "Jumps and crys", "Crys and jumps and crys", "Stands as stone"
p_actions.push -> { p "Stands as stone" }

playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])
#створюєм новий playground з масивом та хешами в середині

playground.call_over(p_actions)  # викликаємо метод об’єкту з масивом, в якості аргументу
