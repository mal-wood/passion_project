require 'twilio-ruby'

module Notifier
  def self.send_sms_notification(number, body)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    send_sms(client, number, body)
  end


  def self.send_sms(client, number, body)
    twilio_number = '+17249127417'
    message = client.account.messages.create(
    from: twilio_number,
    to: number,
    body: body

    )
    puts "An sms notifying the last application error was..."
  end
  private_class_method :send_sms
end
