if Rails.env.production?
    Rails.configuration.stripe = {
      publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
      secret_key: ENV['STRIPE_SECRET_KEY']
    }
  else
    Rails.configuration.stripe = {
      publishable_key: 'pk_test_11l0MEJGOIRAFgwdBIrVpS57000LH58TpP',
      secret_key: 'sk_test_YwCAQ9HcV5UAzmqLPx2cI26800BRci7Dv1'
    }
  end
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]