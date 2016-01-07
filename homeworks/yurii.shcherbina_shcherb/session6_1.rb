# Пример демонстрирует применение лямбда-объектов, передачу блока в качестве параметра метода,
# создание замкнутых лямбда-объектов.
# В ходе выполнения создается массив лямбда-объектов, объект, содержащий массив замкнутых лямбда-объектов.
# Итог работы - вызов метода для выполнения замкнутого лямбда-объекта, который в первую очередь выполняет
# "замкнутый" блок, затем вызывает метод выполнения для лямбда-объекта, переданного в качестве параметра
# Подробно описано ниже.

class PlayersFactory                        # Описываем класс PlayersFactory
                                            # Класс имеет только один метод класса create_player
  # Метод класса call_over принимает три параметра - name, position и блок кода
  # Метод call_over возвращает замкнутый лямбда-объект. который "замыкает" в себе значения
  # переменных player_name, position и переданный параметр-блок &block.
  # Кроме того, сам замкнутый лямбда-объект имеет параметр own_block, в который при вызове метода call
  # передается другой лямбда-объект
  def self.create_player(name, position, &block)
    player_name = name

    # Это и есть возвращаемый замкнутый лямбда объект:
    ->(own_block) do                  # own_block - параметр замкнутого лямбда-объекта, в который при вызове
                                      # метода call передается другой лямбда-объект
      yield                           # Передача управления "замкнотому" блоку &block
      own_block.call                  # Вызов метода call для лямбда-объекта, который был передан в качестве параметра
                                      #  при вызове замкнутого лямбда-объекта
      p "I'm #{player_name}, and I play as  #{position}"  # Тело замкнутого лямбда-обекта, которое выводит в консоль фразу
                                                          # "I'm {player_name}, and I play as {position}"
    end

  end
end

class Playground                            # Описываем класс Playground
                                            # Класс имеет две переменные экземпляра класса arena_name и players
                                            # и метод call_over
  attr_accessor :arena_name, :players       # Определяем методы-получатели и методы-установщики для переменных
                                            # экземпляра класса атрибуты, доступные для чтения и записи

  # Метод инициализации экземплара класса Playground, ожидаем два параметра: arena_name и player_involved
  def initialize(arena_name, player_involved)

    self.arena_name = arena_name            # Присваиваем переменной экземпляра класса arena_name переданный параметр arena_name
    self.players = []                       # Инициализируем переменную экземпляра класса players, как пустой массив

    # Вызыаем метод-итератор each для параметра player_involved (ожидается что при инициализации экземпляра класса
    # в этот параметр будет передан массив)
    player_involved.each do |player|      # В блок метода-итератора в переменную player поочередно передается каждый
                                          # элемент массива player_involved
      # В переменную экземпляра класса players, которая представляет из себя массив, добавляем результат выполнения
      # синглтон-метода create_player класса PlayersFactory, но только в том случае, когда переменная
      # блока метода-итератора player (или другими словами элемент массива player_involved) имеет ключи :name и :position
      # В качестве параметров метода create_player передаем значения для ключей :name и :position.
      # Третий параметр, который передаем методу - это блок (блок содержит команду вывода в консоль фразы "I`m glad to play on + arena_name")
      # Результат выполнения метода create_player, как описано выше, будет замкнутый лямбда-объект.
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  # Метод экземпляра класса call_over с одним параметром actions. Ожидается, что в actions будет передан массив
  def call_over(actions)
    # Вызыаем метод-итератор each_with_index для параметра экземпляра класса players.
    # В блок метода-итератора в переменную player поочередно передается каждый
    # элемент массива players, который представляет из себя замкнутый лямбда-обект.
    # Далее вызываем для него метод call и в качестве параметра передаем лямбда-обект из массива actions по индексу index.
    self.players.each_with_index { |player, index| player.call(actions[index]) }
  end

end

p_actions = []                                                  # Создаем пустой массив

p_actions.push -> { p "Jumps and crys" }                        # Добавляем в массив лямбда-объект
p_actions.push -> { p "Crys and jumps and crys" }               # ещё один
p_actions.push -> { p "Stands as stone" }                       # и ещё один, итого - три

# Создаем новый экземпляр класса Playground, передаем для инициализации строковый параметр и массив хэшей
playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])

# Вызываем метод экземпляра класса, передаем в качестве параметра массив лямбда-объектов
playground.call_over(p_actions)