class PaymentsController < ApplicationController
before_action :authenticate_user!

    def create
        token = params[:stripeToken]
        @product = Product.find(params[:product_id])
        @user = current_user 
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            amount: (@product.price*100).to_i, # amount in cents, again
            currency: "eur",
            source: token,
            description: @product.name,
            metadata: {'Email-adress:' => params[:stripeEmail]},
            receipt_email: @user.email
          )

          if charge.paid
            Order.create(product_id: @product.id,user_id: @user.id, total: @product.price)
            UserMailer.order_received_email(@email, current_user.first_name, @order).deliver_now
            flash[:success] = 'Your payment was precessed successfully'
          end

        rescue Stripe::CardError => e
          # The card has been declined
          body = e.json_body
          err = body[:error]
          flash[:error] = 'Unfortunately, there was an error with your purchase: #{err[:message]}'
        end

        redirect_to '/simple_pages/photography'

      end

end