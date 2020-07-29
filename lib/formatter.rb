class Formatter
  def self.format_response(res_type, res_object = nil, fname = nil, lname = nil)
    current_date_time = Time.new
    case res_type
    when 'quote'
      "Today\'s Programming quote is:\n\n#{res_object['en']}\n\nAuthor:\t#{res_object['author']}"
    when 'word'
      "Today\'s word of bravity is:\n\n#{res_object['text']}\n\nAuthor:\t#{res_object['author']}"
    when 'time'
        "Hello #{fname} #{lname},\nThe current time is #{current_date_time.strftime('%I:%M %p')}"
    when 'date'
        "Hello #{fname} #{lname},\nThe current date is #{current_date_time.strftime('%a, %B %d, %Y')}"
    end
  end
end
