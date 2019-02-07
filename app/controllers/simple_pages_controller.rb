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
    @products = Product.limit(3)
  end
end

class SimplePagesController < ApplicationController
  def products
    @orders = Order.all
  end
end
