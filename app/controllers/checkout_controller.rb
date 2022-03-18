class CheckoutController < ApplicationController

  # establish a connection to stripe and the redirect the user back to our website
  def create
    product = Product.find(params[:product_id])

    if product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          name:product.name,
          description: product.description,
          amount: product.price_cents,
          currency: "cad",
          quantity: 1
        },
        {
          name:"GST",
          description: "Goods and Service Tax",
          amount: (product.price_cents * 0.05).to_i,
          currency: "cad",
          quantity: 1
        }
      ]

    )

    respond_to do |format|
      format.js
    end
  end

  # tells the customer that we took their money
  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  # Something went wrong with your payment :(
  def cancel

  end
end
