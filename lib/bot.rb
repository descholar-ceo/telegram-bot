require 'telegram/bot'
require_relative 'lookup'
require_relative 'formatter'
require_relative 'constants'

# Bot class
class Bot
  def initialize
    Telegram::Bot::Client.run(Configs::BASE_API_KEY) do |bot|
      bot.listen do |message|
        cases(message, bot)
      end
    end
  end

  private

  def cases(message, bot)
    case message.text.downcase
    when 'start'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::WELCOME_MSG)
    when 'help'
      bot.api.send_message(chat_id: message.chat.id, text: Messages::HELP_MESSAGE)
    when 'quote'
      quote_obj = LookUp.new(Configs::PROGRAMMING_QUOTE_API)
      my_quote = quote_obj.read
      bot.api.send_message(chat_id: message.chat.id, text: Formatter.format_response('quote', my_quote).to_s)
    when 'word'
      quote_obj = LookUp.new(Configs::WORD_OF_DAY_API)
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
