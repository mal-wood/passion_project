# require 'dotenv'
# require 'twilio-ruby'
# Dotenv.load
# # put this in the model folder


# module Notifier
#   def self.send_sms_notification(number, body)
#     client = Twilio::REST::Client.new ENV[TWILIO_ACCOUNT_SID], ENV[TWILIO_AUTH_TOKEN]
#     send_sms(client, number, message)
#   end


#   def self.send_sms(client, number, body)
#     twilio_number = '+17249127417'
#     message = client.account.messages.create(
#     from: twilio_number,
#     to: number,
#     body: body

#     )
#     puts "An sms notifying the last application error was..."
#   end
#   private_class_method :send_sms
# end


# # client = Twilio::REST::Client.new('AC2d6e04523e623c9a1bdcdfe21a2a667f', 'b5852d6ac16e4305d8a53e809fde19f2')