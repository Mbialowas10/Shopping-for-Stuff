class CheckoutController < ApplicationController

  def create
    # establish a connection with Stripe and redirect the user to the payment screen
    @product = Product.find(params[:product_id])

    if @product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
			#went to stripe API, looked up sessions, figured it all out..
			payment_method_types: ["card"],
			success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
			cancel_url: checkout_cancel_url,
      mode: "payment",
			line_items: [
			  {
				quantity: 1, # We will hardcode one for this demo.
        price_data: {
          unit_amount: @product.price_cents,
          currency: "cad",
            product_data: {
              name: @product.name,
              description: @product.description,
            }
        }
			  },
			  {
			  	quantity: 1,
          price_data: {
            currency: "cad",
            unit_amount: (@product.price_cents * 0.05).to_i,
            product_data: {
              name: "GST",
              description: "Goods and Services Tax",
            }
          }
        },
        {
        quantity: 1,
        price_data: {
          currency: "cad",
          unit_amount: (@product.price_cents * 0.07).to_i,
          product_data: {
            name: "PST",
            description: "Provincial Sales Tax",
          }
          }
        }
			]
		)

    # respond_to do  |format|
    #   format.js
    # end
    redirect_to @session.url, allow_other_host: true

  end

  def success
    # WE TAKEN YOUR MONEY
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # the transaction process stopped
  end
end
