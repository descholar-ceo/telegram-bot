require 'telegram/bot'

# Bot class
class Bot
  def initialize
    api_key = '1329880993:AAH7I_sHE8zD_cswXoHO0ksSEte0i-upM2s'

    Telegram::Bot::Client.run(api_key) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello! From nezabot')
        else
            bot.api.send_message(chat_id: message.chat.id, text: 'Sorry! Invalid input')
        end
      end
    end
  end
end
