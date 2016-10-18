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

  if message.text =~ /Olá!/
    Bot.deliver(
        recipient: message.sender,
        message: {
            text: 'Hello, human!'
        }
    )
  end

  if message.text =~ /Me conta da academia./
    Bot.deliver(
        recipient: message.sender,
        message: {
            attachment: {
                type: 'template',
                payload: {
                    template_type: 'button',
                    text: 'Então, sobre o que você quer saber?',
                    buttons: [
                        { type: 'postback', title: 'Horários', payload: 'HORARIOS' },
                        { type: 'postback', title: 'Valores', payload: 'VALORES' },
                        { type: 'postback', title: 'EquilibraBot?', payload: 'BIRL' }
                    ]
                }
            }
        }
    )
  end
end


Bot.on :postback do |postback|
  postback.sender    # => { 'id' => '1008372609250235' }
  postback.recipient # => { 'id' => '2015573629214912' }
  postback.sent_at   # => 2016-04-22 21:30:36 +0200
  postback.payload   # => 'EXTERMINATE'

  if postback.payload == 'VALORES'
    Bot.deliver(
        recipient: postback.sender,
        message: {
            text: 'Primeira aula de graça!'
        }
    )
  end

  if postback.payload == 'HORARIOS'
    Bot.deliver(
        recipient: postback.sender,
        message: {
            text: 'Seg a Sex das 8:00 as 22:00'
        }
    )
  end

  if postback.payload == 'BIRL'
    Bot.deliver(
        recipient: postback.sender,
        message: {
            text: 'BIIIIIIIIIIRRRRRRLLLLLLLLLLLLLL'
        }
    )
  end
end

Facebook::Messenger.config.access_token = ENV['MESSENGER_ACCESS_TOKEN']
Facebook::Messenger.config.verify_token = ENV['MESSENGER_VERIFY_TOKEN']
Facebook::Messenger::Subscriptions.subscribe
