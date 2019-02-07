class OrdersController < ApplicationController

    def products
        @orders = Order.all
    end

    def show
        @orders = Order.find(params[:id])
    end
  
    def new
    end
  
    def create
    end
  
    def destroy
    end
end