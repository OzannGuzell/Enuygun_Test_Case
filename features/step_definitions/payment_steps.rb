payment = PaymentPage.new

And(/^payment the flight$/) do
  payment.payment_flight
end