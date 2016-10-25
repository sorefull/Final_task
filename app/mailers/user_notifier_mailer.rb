require 'sendgrid-ruby'
class UserNotifierMailer < ActionMailer::Base
  def send_order_email(user, order)
    # binding.pry
    # @user = user
    # @order = order
    #
    # mail = Mail.new do
    #   from     'me@test.lindsaar.net'
    #   to       @user.mail
    #   subject  'Here is your order'
    # end
    #
    # # mail.delivery_method :sendmail
    # binding.pry
    #
    # mail.deliver

    mail = Mail.deliver do
      to 'yourRecipient@domain.com'
      from 'Your Name <name@domain.com>'
      subject 'This is the subject of your email'
      text_part do
        body 'Hello world in text'
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body '<b>Hello world in HTML</b>'
      end
    end
  end

end
