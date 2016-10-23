require 'telegram/bot'
token = '284309043:AAFYP1v056gxmJa-u42UFDEn1HJWAMIAvOg'
$g=true
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if $g
      puts message.methods
    else
      $g=nil
    end
    case message.text
    when '/start', '/123'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    else
      bot.api.sendMessage(chat_id: message.chat.id, text: "I miss understand you!" + "  #{message.text}")
    end
  end
end
