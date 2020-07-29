require 'dotenv'

Dotenv.load

module Messages
  BOT_COMMAND_LINE_MSG = "\n\t\t\t\t\t\tHello! This is NezaBot!
  \t\t\t\t\t\t=======================

  I am not a human, I am just a bot. When I am connected, I can receive some commands of users,
  from their telegram accounts, and I look for them an appropriate answer. So far I am able to find the following:

  \n\t\t\t\t=>Programming quote : user has to send me 'quote' as a message
  \n\t\t\t\t=>Word of bravity : user has to send me 'word' as a message
  \n\t\t\t\t=>Current time : user has to send me 'time' as a message
  \n\t\t\t\t=>Current date : user has to send me 'date' as a message

  If you want me to stop, you can press Ctrl + C (Windows / Linux), or Command + C (MacOS)

  Mugirase Emmanuel (descholar) is my developer,
  you can contact him on emmamugira@gmail.com, for idea, feature request, or bug fix!

  ".freeze
  WELCOME_MSG = 'Hello! From nezabot'.freeze
  HELP_MESSAGE = 'That is the list of help'.freeze
  BAD_COMMAND = 'Sorry! Invalid input, type help and hit send for more info'.freeze
end

module Configs
  BASE_API_KEY = ENV['TELEGRAM_BOT_API_TOKEN']
  PROGRAMMING_QUOTE_API = ENV['PROGRAMMING_QUOTE_API']
  WORD_OF_DAY_API = ENV['WORD_OF_DAY_API']
end

module TestMockData
  SAMPLE_QUOTE_TO_USER = "Today\'s Programming quote is:\n
Once a new technology starts rolling, if you’re not part of the steamroller, you’re part of the road.
\nAuthor:\tStewart Brand".freeze

  SAMPLE_WORD_TO_USER = "Today\'s word of bravity is:\n
You give before you get.
\nAuthor:\tConfucius".freeze

  SAMPLE_QUOTE_FROM_INTERNET = {
    '_id' => '5a6ce86f2af929789500e83d',
    'en' => 'Once a new technology starts rolling, if you’re not part of the steamroller, you’re part of the road.',
    'author' => 'Stewart Brand', 'rating' => 2.9, 'id' => '5a6ce86f2af929789500e83d'
  }.freeze

  SAMPLE_WORD_FROM_INTERNET = {
    'text' => 'You give before you get.',
    'author' => 'Confucius'
  }.freeze

  SAMPLE_DATE = "Hello neza bot,\nThe current date is Wed, July 29, 2020".freeze
  SAMPLE_TIME = "Hello neza bot,\nThe current time is 10:26 PM".freeze
end
