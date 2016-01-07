class PlayersFactory

  def self.create_player(name, position, &block)

    player_name = name

    ->(own_block) do
      yield
      own_block.call
      p "I'm #{player_name}, and I play as  #{position}"
    end

  end

end

# Створюємо клас, з методом класу "create_player", який повертає лямбду,
# яка викликає переданний блок,
# а потім викликає лямбду з масиву "p_actions"
# і виводить текст з параметрами


class Playground


  attr_accessor :arena_name, :players

  def initialize(arena_name, player_involved)

    self.arena_name = arena_name
    self.players = []
    player_involved.each do |player|
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  # ініцалізуємо інстанс класу,
  # проходимо по педеданному масиву з хешами
  # і якщо є відповідні ключі, передаємо їх та блок в метод класу "PlayersFactory"

  def call_over(actions)
    self.players.each_with_index { |player, index| player.call(actions[index]) }
  end

# проходимось в циклі по "players"
# і для кожного викликаємо лямбду, яку повертає метод "create_player"

end


p_actions = []

p_actions.push -> { p "Jumps and crys" }
p_actions.push -> { p "Crys and jumps and crys" }
p_actions.push -> { p "Stands as stone" }

# створення масиву з лямбдами

playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])

# створення інстансу "Playground"

playground.call_over(p_actions)

# виклик методу інстансу

