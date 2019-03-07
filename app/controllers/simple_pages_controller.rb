class SimplePagesController < ApplicationController
  def index
  end
end

class SimplePagesController < ApplicationController
  def landing_page
    @products = Product.limit(3)
  end
end

class SimplePagesController < ApplicationController
  def photography 
    @products = Product.all
  end
end

class SimplePagesController < ApplicationController
  def products
    redirect_to "/simple_pages/photography"
  end
end

class SimplePagesController < ApplicationController
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
        to: 'mail@d-dziamski.de',
        subject: "A new contact form message from #{@name}",
        body: @message).deliver_now
  end
end