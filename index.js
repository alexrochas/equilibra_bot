var Bottr = require('bottr')

var bot = new Bottr.Bot()
bot.use(new Bottr.FacebookMessengerClient())

bot.hears(/Olá!/, function (message, session) {
    session.send("Olá, no que posso ajudar?")
})

bot.hears(/Hoje tem treino?/, function (message, session) {
    session.send("Tem sim!")
})

bot.hears([/.+/], function(message, session) {
    session.send("Não entendi. =/")
})

bot.listen()
