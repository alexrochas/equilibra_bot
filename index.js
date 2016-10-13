var Bottr = require('bottr')
var BottrApp = require('bottr-app')

var bot = new Bottr.Bot()
bot.use(new BottrApp())

bot.on('message_received', function (message, session) {
    if(message.text.match(/Hoje tem treino?/)) {
        session.send("Tem sim!")
    } else {
        session.send("Não entendi. =/")
    }
})

bot.listen()
