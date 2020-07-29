class Formatter
  def self.format_response(res_type, res_object)
    case res_type
    when 'quote'
      "Today\'s Programming quote is:\n\n#{res_object['en']}\n\nAuthor:\t#{res_object['author']}"
    when 'word'
      "Today\'s word of bravity is:\n\n#{res_object['text']}\n\nAuthor:\t#{res_object['author']}"
    end
  end
end
