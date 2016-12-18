# EquilibraBot
> Facebook Messenger Bot

The main objective of this bot is to increase the interaction with students and goers of Equilibra Gym at Porto Alegre/RS.

## Development

Made with [facebook-messenger](https://github.com/hyperoslo/facebook-messenger) gem.

To test it, install [ngrok](https://www.npmjs.com/package/ngrok).

```shell
npm install -g ngrok 
```

Once installed, run equilibrabot with **rackup** on root folder and initialize ngrok.

```
ngrok http 9292
```

Now register the generated url to your facebook app on https://developers.facebook.com/apps/

Also, this bot uses environment variables for access facebook tokens.

```
export MESSENGER_ACCESS_TOKEN=EAADkaiN...
export MESSENGER_VERIFY_TOKEN=my_awesome_token
```

## Usage

Open a new chat with [EquilibraBot](m.me/equilibrabot) and talk with him!

## Release History

* 0.0.1
    * Work in progress

## Meta

Alex Rocha - [about.me](http://about.me/alex.rochas)

