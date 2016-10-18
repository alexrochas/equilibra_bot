# bot.rb
require 'facebook/messenger'

include Facebook::Messenger

puts 'Started?'
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

Facebook::Messenger.config.access_token = 'EAADkaiNsHSYBAJYOZCl91UUn9O41iiFFlpnoeDvqyUJvnxGVwZAhdNgGsB3VrCghC9IOr1pvJlVXxo8V7n0TwOb9BNXQeZAJic700gj3gXiAtgIkddm38OTutnPNtNfjV2OU6u4mqSzBiSWLyXp3Qv4BfHbV2x2Xud6yIIeyQZDZD'
Facebook::Messenger.config.app_secret = '__app_secret_here__'
Facebook::Messenger.config.verify_token = 'xIn9f1mYAi220VU729805f7o45P5Ad16ENV'
Facebook::Messenger::Subscriptions.subscribe
