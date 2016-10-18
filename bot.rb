# bot.rb
require 'facebook/messenger'

include Facebook::Messenger

Bot.on :message do |message|
  puts 'Message received'
  message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender      # => { 'id' => '1008372609250235' }
  message.seq         # => 73
  message.sent_at     # => 2016-04-22 21:30:36 +0200
  message.text        # => 'Hello, bot!'
  message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  Bot.deliver(
      recipient: message.sender,
      message: {
          text: 'Hello, human!'
      }
  )
end