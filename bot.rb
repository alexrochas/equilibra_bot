# bot.rb
require 'facebook/messenger'

include Facebook::Messenger

puts 'Started?'
Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
  message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender      # => { 'id' => '1008372609250235' }
  message.seq         # => 73
  message.sent_at     # => 2016-04-22 21:30:36 +0200
  message.text        # => 'Hello, bot!'
  message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  message.reply(
      attachment: {
          type: 'template',
          payload: {
              template_type: 'button',
              text: 'Olá humano, bem vindo ao EquilibraBot. Bot de informações da Academia Equilibra!',
              buttons: [
                  { type: 'postback', title: 'Horários?', payload: 'HORARIOS' },
                  { type: 'postback', title: 'Valores?', payload: 'VALORES' },
                  { type: 'postback', title: 'Promoções?', payload: 'PROMOCOES' }
              ]
          }
      }
  )
end


Bot.on :postback do |postback|
  postback.sender    # => { 'id' => '1008372609250235' }
  postback.recipient # => { 'id' => '2015573629214912' }
  postback.sent_at   # => 2016-04-22 21:30:36 +0200
  postback.payload   # => 'EXTERMINATE'

  if postback.payload == 'VALORES'
    postback.reply(
        attachment: {
            type: 'image',
            payload: {
                url: 'https://scontent.fpoa4-1.fna.fbcdn.net/v/t1.0-9/14492421_318178135212550_2909746139291345882_n.jpg?oh=6b9682b6aaea2256bab8ed2dd69329cc&oe=58EC0AB3'
            }
        }
    )
  end

  if postback.payload == 'HORARIOS'
    postback.reply(
            text: 'Musculação é de Seg a Sex das 8:00 as 22:00, aos Sáb das 9h30 até as 14h!'
    )
  end

  if postback.payload == 'PROMOCOES'
    postback.reply(
        attachment: {
            type: 'image',
            payload: {
                url: 'https://scontent.fpoa4-1.fna.fbcdn.net/v/t1.0-9/15284799_355862784777418_8437965891793097604_n.jpg?oh=de39a6d4964d530e5e52e958eb210d09&oe=58F0813E'
            }
        }
    )
  end
end

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN'])
