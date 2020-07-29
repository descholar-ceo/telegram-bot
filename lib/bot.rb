require 'telegram/bot'
require_relative 'lookup'
require_relative 'formatter'
require_relative 'messages'

# Bot class
class Bot
  def initialize
    api_key = '1329880993:AAH7I_sHE8zD_cswXoHO0ksSEte0i-upM2s'

    Telegram::Bot::Client.run(api_key) do |bot|
      bot.listen do |message|
        case message.text.downcase
        when 'start'
          bot.api.send_message(chat_id: message.chat.id, text: Messages::WELCOME_MSG)
        when 'help'
          bot.api.send_message(chat_id: message.chat.id, text: Messages::HELP_MESSAGE)
        when 'quote'
          quote_obj = LookUp.new('https://programming-quotes-api.herokuapp.com/quotes/lang/en')
          my_quote = quote_obj.read
          bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response('quote', my_quote).to_s)
        when 'word'
          quote_obj = LookUp.new('https://type.fit/api/quotes')
          my_word = quote_obj.read
          bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response('word', my_word).to_s)
        when 'time'
          bot.api.send_message(
            chat_id: message.chat.id,
            text: Formatter.format_response('time', nil, message.from.first_name, message.from.last_name)
          )
        when 'date'
          bot.api.send_message(
            chat_id: message.chat.id,
            text: Formatter.format_response('date', nil, message.from.first_name, message.from.last_name)
          )
        else
          bot.api.send_message(chat_id: message.chat.id, text: Messages::BAD_COMMAND)
        end
      end
    end
  end
end
