class UserMailer < ApplicationMailer
    default from: "mail@d-dziamski.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'your-email@example.com',
         subject: "A new contact form message from #{name}")
  end

  def order_received_email(email, name, order)
		@name = name
		@order = order
		mail(
			from: "mail@d-dziamski.de",
			to: email,
			subject: "Thank you for your purchase!")
	end

  def welcome(user)
    @appname = "for Senses"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

end

