require 'sendgrid-ruby'
class UserNotifierMailer < ActionMailer::Base
  def send_order_email(user, order)
    Mail.defaults do
      delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                               :port      => 587,
                               :domain    => "floating-beyond-23845.herokuapp.com",
                               :user_name => ENV['SENDGRID_USERNAME'],
                               :password  => ENV['SENDGRID_PASSWORD'],
                               :authentication => 'plain',
                               :enable_starttls_auto => true }
    end
    mail = Mail.deliver do
      to @user.email
      from 'sales@spalahshop.com'
      subject 'Thanks for buying in our Spalah shop'
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
