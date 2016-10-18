# config.ru
require 'facebook/messenger'
require_relative 'bot'

Facebook::Messenger.config.access_token = ENV['MESSENGER_ACCESS_TOKEN']
Facebook::Messenger.config.app_secret = '__app_secret_here__'
Facebook::Messenger.config.verify_token = ENV['MESSENGER_VERIFY_TOKEN']
Facebook::Messenger::Subscriptions.subscribe

run Facebook::Messenger::Server