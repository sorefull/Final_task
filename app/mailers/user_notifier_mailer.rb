class UserNotifierMailer < ActionMailer::Base
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_order_email(user, order)
    @user = user
    @order = order
    mail( :to => @user.email, :subject => 'Thanks for buying our products in SPALAH Shop' )
  end
end
