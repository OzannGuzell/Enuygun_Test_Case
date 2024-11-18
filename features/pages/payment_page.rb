class PaymentPage
  def initialize
    @credit_card_number_css = "[data-testid='cardNumber-input-comp']"
    @credit_card_month_css = "[data-testid='cardMonth-input']"
    @credit_card_year_css = "[data-testid='cardYear-input']"
    @payment_button_css = "[data-testid='payment-form-submit-button']"
    @total_price_css = "[data-testid='TotalAmount']"
  end

  def payment_flight
    GeneralUtils.wait_until_visible(:css,@total_price_css)
    total_price = find(@total_price_css).text
    GeneralUtils.log_info total_price
    GeneralUtils.log_info $FLIGHT_PRICE
    if total_price == $FLIGHT_PRICE
      GeneralUtils.log_info "Total price is equal to flight price"
    else
      raise "Error: Total price (#{total_price}) does not match the flight price (#{$FLIGHT_PRICE})."
    end
    GeneralUtils.wait_until_visible(:css, @credit_card_number_css)
    find(@credit_card_number_css).send_keys CREDIT_CARD[:card_number]
    GeneralUtils.log_info "#{CREDIT_CARD[:card_number]} - card number entered"
    find(@credit_card_month_css).send_keys CREDIT_CARD[:card_month]
    GeneralUtils.log_info "#{CREDIT_CARD[:card_month]} - card month entered"
    find(@credit_card_year_css).send_keys CREDIT_CARD[:card_year]
    GeneralUtils.log_info "#{CREDIT_CARD[:card_year]} - card year entered"
    find(@payment_button_css).click
  end

end