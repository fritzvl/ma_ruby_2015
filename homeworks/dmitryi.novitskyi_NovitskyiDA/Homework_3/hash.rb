hash = {
    first_value: 111,
    second_value: 2,
    third_value: 33,
    first_text: 'Hello world!',
    second_text: 'Hello people!!!',
    third_text: 'Hi guys'
}

#Вывод значения по ключу
puts hash[:second_text]
#Изменение значения по ключу
puts hash[:third_value] = 3333
#Установка значения по-умолчанию, когда ключа не существует
hash.default = 'You entered an invalid key. Try again'
puts hash[:hello]
#Создание новой пары ключ - значение
hash[:some_key] = 'Some key'
#Удаление пары по ключу
hash.delete(:third_text)
#Вывод ключа по значению
puts hash.key(3333)
#Вывод длины Hash
puts hash.length
puts hash
puts '________________________________________________________________________________'

puts 'Вывести Hash в формате \'ключ => значение\''
hash.each {|key, value| puts "#{key} => #{value}"}
puts '________________________________________________________________________________'

