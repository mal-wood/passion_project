require 'dotenv'
require 'twilio-ruby'
Dotenv.load
# put this in the model folder


module Notifier
  def self.send_sms_notification(phone_number, message)
    # alert_message = "It's time to take your meds!"
    client = Twilio::REST::Client.new('AC2d6e04523e623c9a1bdcdfe21a2a667f','b5852d6ac16e4305d8a53e809fde19f2')

    # phone_number = ENV['ADMIN_PHONE']
    send_sms(client, phone_number, message)
  end


  def self.send_sms(client,phone_number, alert_message)
    twilio_number = '+17249127417'
    message = client.account.messages.create(
    from: twilio_number,
    to: phone_number,
    body: alert_message,

    )
    puts "An sms notifying the last application error was..."
  end
  private_class_method :send_sms
end


# client = Twilio::REST::Client.new('AC2d6e04523e623c9a1bdcdfe21a2a667f', 'b5852d6ac16e4305d8a53e809fde19f2')
Notifier.send_sms_notification("+17248126820", "thing")