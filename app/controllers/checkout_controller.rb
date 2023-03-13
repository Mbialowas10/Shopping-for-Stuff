class CheckoutController < ApplicationController
  def create
    # establish a connection to Stripe and then redirect the user to the payment screen
    product = Product.find(params[:product_id])

    if product.nil?
      redirect_to root_path
      return
    end

    line_items = {
      price_data: {
        currency: 'cad',
        unit_amount: product.price_cents,
        product_data: {
          name: product.name,
          description: product.description
        }
      },
      quantity: 1
    },
                 taxes = {
                   gst: {
                     name: 'GST',
                     description: 'Good and Service Tax',
                     unit_price: (product.price_cents * 1.05).to_i,
                     currency: 'cad',
                     quantity: 1

                   }
                 }
    # line_item.append(line_items)

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
      mode: 'payment',
      line_items: [
        name: product.name,
        description: product.description,
        amount: product.price_cents, # price * 100.to_i
        currency: 'cad',
        quantity: 1
      ]
      # line_items: line_item
    )
    # respond_to do | format |
    # format.js #app/views/checkout/create.js.erb
    # end

    redirect_to @session.url, allow_other_host: true
  end

  def success
    # we took the customer's money
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # something went wrong with payment!
  end
end
