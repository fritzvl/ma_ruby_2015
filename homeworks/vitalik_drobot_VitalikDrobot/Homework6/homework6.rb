class PlayersFactory
#Створили фабрику бо є потреба у визначенні певних властивостей (name, position) і блоку.
#Це круто бо  не треба для кожного гравця писати це все заново.

  def self.create_player(name, position, &block) #Метод створення гравця з такими ознаками:
    #name, position, block. Тобто зараз гравець має тільки три ознаки імя, позицію на якій грає, і блок доповіді.

    player_name = name

    ->(own_block) do  #створюється багатострочна лямбда
      yield #викликаємо блок
      own_block.call #звертаємося до методу call для блоку
      p "I'm #{player_name}, and I play as  #{position}" # тут все очевидно організували друк на екран
    end

  end

end

class Playground

  attr_accessor :arena_name, :players #глобальна обява змінних через створення для них рідера і врайтера в одну строку.


  def initialize(arena_name, player_involved) #метод де визначається арени на якій йде гра

    self.arena_name = arena_name #переприсвоєння
    self.players = [] #створення масиву
    player_involved.each do |player|
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
      #З цьої частини зрозумів, що в масив закидуються значення імені та позицію на якій він грає.
      #Незрозуміло як працює |player|
    end

  end

  def call_over(actions)
    self.players.each_with_index { |player, index| player.call(actions[index]) }#трохи не зрозумів
  end

end

p_actions = []

p_actions.push -> { p "Jumps and crys" }# дописується  в блок
p_actions.push -> { p "Crys and jumps and crys" }
p_actions.push -> { p "Stands as stone" }

playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])
#Ствоюється новий обєкт Playground і для нього визначаються самі значення імен та позицій. Вони знаходяться в масиві з хешів.


playground.call_over(p_actions) #визивається метод .call_over
# Задача якого розібратись з масивом хешів
#якось так