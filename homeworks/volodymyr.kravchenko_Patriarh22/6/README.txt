p_actions = []

- Створення пустого масиву

p_actions.push -> { p "Jumps and crys" }  
p_actions.push -> { p "Crys and jumps and crys" }   
p_actions.push -> { p "Stands as stone" } `
  
- додання до масиву p_actions трьох об'єктів типу lambda, задачею яких є виведення інформації про дії, які виконує гравець на полі.

playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])

- створення екземпляру класу Playground та передача його методу initialize в якості параметрів строки ("Football arena #1") та масиву, що складається із хешів (ім'я гравця та його позиція на полі).

**class Playground**

attr_accessor :arena_name, :players

- в класі Playground визначаються методи геттери та сеттери для відповідних полів.

def initialize(arena_name, player_involved)   
    self.arena_name = arena_name  
    self.players = [] 
    player_involved.each do |player|  
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)    
    end   
end

- визначаються змінна arena_name рівня екземпляру класу та визначається змінна players як пустий масив;
- для кожного елементу отриманого масиву хеш-об'єктів player_involved викликається метод create_player класу PlayersFactory, куди передаються параметри гравця :name та :position, а також блок;
- створюється масив players, що складається із lambda-об'єктів визначеної структури у методі PlayersFactory.create_player;

**class PlayersFactory**

def self.create_player(name, position, &block)    
    player_name = name    
    ->(own_block) do    
      yield   
      own_block.call    
      p "I'm #{player_name}, and I play as  #{position}"    
    end   
end   

- задачею методу create_player являється динамічне створення lambda-об'єктів із вказаною структурою, а саме - коли відбувається виклик PlayersFactory.create_player, то для кожного гравця створюється lambda, яка очікує на вході параметр own_block, далі відбувається вставка отриманого методом блоку ({ p "I`m glad to play on #{self.arena_name}" }), потім виклик own_block.call (це передбачає, що отриманий параметр own_block теж lambda-об'єкт), далі строка виводу інформації про ім'я гравця та його позицію.

playground.call_over(p_actions)

- виклик методу call_over для екземпляру класу із передачею цьому методу в якості параметру створеного масиву p_actions, який складається із lambda-об'єктів.

**class Playground**

def call_over(actions)    
    self.players.each_with_index { |player, index| player.call(actions[index]) }    
end

- відбувається виклик кожного lambda-об'єкту масиву players із передачею йому параметру у вигляді елементу масиву lambda-об'єктів actions згідно їх порядкового індексу.

**В загальному:**
- створили масив p_actions із lambda;
- створили масив players із lambda такої структури:

->(own_block) do    
      p "I`m glad to play on #{self.arena_name}"    
      own_block.call    
      p "I'm #{player_name}, and I play as  #{position}"    
end

- викликали кожен lambda-об'єкт масиву players і передали йому в якості параметру відповідний lambda-об'єкт масиву p_actions
- отримали структуру для виводу інформації:

p "I`m glad to play on #{self.arena_name}"    
p p_actions[index]    
p "I'm #{player_name}, and I play as  #{position}"    
