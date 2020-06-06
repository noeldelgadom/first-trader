module SendGridTool
# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

  def self.daily_trading_mail
    me        = 'noeldelgadom@gmail.com'
    from      = Email.new(email: me)
    to        = Email.new(email: me)
    subject   = 'Daily Trading Email: ' + Date.today.to_s
    content   = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail      = Mail.new(from, subject, to, content)

    sg        = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response  = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end