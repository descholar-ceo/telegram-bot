require 'telegram/bot'
require_relative 'quotes'
require_relative 'word-of-day'
require_relative 'city-info'

# Bot class
class Bot
  def initialize
    api_key = '1329880993:AAH7I_sHE8zD_cswXoHO0ksSEte0i-upM2s'

    Telegram::Bot::Client.run(api_key) do |bot|
      bot.listen do |message|
        city_regex = message.text.match(/^city (?<{city_name}>\w*)$/)
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello! From nezabot')
        when '/help'
          bot.api.send_message(chat_id: message.chat.id, text: 'That is the list of help')
        when 'quote'
            my_quote = Quotes.new
            my_quote = my_quote.select_random
            bot.api.send_message(chat_id: message.chat.id, text:"#{my_quote}")
        when 'word'
            my_word = Word.new
            my_word = my_word.select_random
            bot.api.send_message(chat_id: message.chat.id, text:"#{my_word}")
        when 'name'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} #{message.from.last_name}")
        when city_regex
            my_city = CityInfo.new
            my_city = my_city.select_random
            bot.api.send_message(chat_id: message.chat.id, text:"#{my_city}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: 'Sorry! Invalid input, type /help and hit send for more info')
        end
      end
    end
  end
end
