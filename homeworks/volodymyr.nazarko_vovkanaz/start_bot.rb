require 'telegram/bot'
token = '159528223:AAFA-XoRiLy3-fYxKWDdwZy6hacbsKKJox4'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      when '/zakaz'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Cегодня сударь будет кушать:") 		
      bot.api.send_photo(chat_id: message.chat.id, photo: File.new('/home/vova/Desktop/beauty.jpg'))
      bot.api.sendMessage(chat_id: message.chat.id, text: "и запивать:") 		
      bot.api.send_photo(chat_id: message.chat.id, photo: File.new('/home/vova/Desktop/kvas.png'))
      when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end