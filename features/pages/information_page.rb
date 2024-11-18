class InformationPage
  def initialize
    @mail_css = '#contact_email'
    @phone_number_css = ".phone-number.tr-mask-phone-number"
    @first_name_css = '#firstName_0'
    @last_name_css = '#lastName_0'
    @birthdate_day_css = '#birthDateDay_0'
    @birthdate_month_css = '#birthDateMonth_0'
    @birthdate_year_css = '#birthDateYear_0'
    @id_number_css = "[data-testid='reservation-publicid-TR-input']"
    @continue_button_css = "#continue-button"
    @flight_price_id = "priceInfoGrandTotal"
  end

  def fill_information
    find(@mail_css).send_keys USER_INFORMATION[:email]
    GeneralUtils.log_info "#{USER_INFORMATION[:email]} - mail entered"
    find(@phone_number_css).send_keys USER_INFORMATION[:phone]
    GeneralUtils.log_info "#{USER_INFORMATION[:phone]} - phone number entered"
    find(@first_name_css).send_keys USER_INFORMATION[:first_name]
    GeneralUtils.log_info "#{USER_INFORMATION[:first_name]} - first name entered"
    find(@last_name_css).send_keys USER_INFORMATION[:last_name]
    GeneralUtils.log_info "#{USER_INFORMATION[:last_name]} - last name entered"
    find(@birthdate_day_css).send_keys USER_INFORMATION[:birth_day]
    GeneralUtils.log_info "#{USER_INFORMATION[:birth_day]} - birthdate day entered"
    find(@birthdate_month_css).send_keys USER_INFORMATION[:birth_month]
    GeneralUtils.log_info "#{USER_INFORMATION[:birth_month]} - birthdate month entered"
    find(@birthdate_year_css).send_keys USER_INFORMATION[:birth_year]
    GeneralUtils.log_info "#{USER_INFORMATION[:birth_year]} - birthdate year entered"
    find(@id_number_css).send_keys USER_INFORMATION[:id_number]
    GeneralUtils.log_info "#{USER_INFORMATION[:id_number]} - ID number entered"
    $FLIGHT_PRICE = find(:id,@flight_price_id).text
    GeneralUtils.wait_until_visible(:css,@continue_button_css)
    find(@continue_button_css, wait: 5).click
  end
end