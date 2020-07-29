require 'dotenv'

Dotenv.load

module Messages
  WELCOME_MSG = 'Hello! From nezabot'.freeze
  HELP_MESSAGE = 'That is the list of help'.freeze
  BAD_COMMAND = 'Sorry! Invalid input, type help and hit send for more info'.freeze
end

module Configs
  BASE_API_KEY = ENV['TELEGRAM_BOT_API_TOKEN']
  PROGRAMMING_QUOTE_API = ENV['PROGRAMMING_QUOTE_API']
  WORD_OF_DAY_API = ENV['WORD_OF_DAY_API']
end
