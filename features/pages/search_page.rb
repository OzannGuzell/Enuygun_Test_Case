class SearchPage
  def initialize
    @departure_arrival_times_css = '.ctx-filter-departure-return-time.card-header'
    @departure_noon_css = '.search__filter_departure-noon'
    @departure_slider_css = '.rc-slider-handle.rc-slider-handle-2'
    @departure_times_css = '.flight-departure-time'
    @filter_slider_content_css = '.filter-slider-content'
    @turkish_airlines_text_css = '.summary-marketing-airlines'
    @flight_price_css = '.flight-summary-price'
    @success_button_css = ".btn-success"
    @select_proceed_button_css = '.btn-outline-success'
  end

  def filter_departure_times
    GeneralUtils.wait_until_visible(:css, @departure_arrival_times_css)
    find(@departure_arrival_times_css).click
    first(@departure_noon_css).click
    slider = first(@departure_slider_css)
    PageHelper.drag_slider(slider)
    first(@departure_slider_css, wait: 5).click
    GeneralUtils.log_info "Departure times between '10:00' and '18:00'"
  end

  def extract_slider_times
    times = first(@filter_slider_content_css).text.scan(/\d{2}:\d{2}/)
    times
  end

  def validate_time_in_range(time_text, start_time, end_time)
    time = Time.strptime(time_text, '%H:%M')
    start = Time.strptime(start_time, '%H:%M')
    finish = Time.strptime(end_time, '%H:%M')
    raise "Error: Departure time #{time_text} is not between #{start_time} and #{end_time}!" unless time.between?(start, finish)
  end

  def verify_listed_flights
    start_time, end_time = extract_slider_times
    departure_times = page.all(@departure_times_css)
    departure_times.each { |time_element| validate_time_in_range(time_element.text.strip, start_time, end_time) }
    GeneralUtils.log_info "All times are between #{start_time} and #{end_time}."
  end

  def verify_prices_turkish_airlines
    airlines = page.all(@turkish_airlines_text_css)
    prices = page.all(@flight_price_css)
    thy_prices = []
    airlines.each_with_index do |airline, index|
      if airline.text.include?("Türk Hava Yolları")
        price_text = prices[index].text.strip
        price = price_text.gsub(/[^\d.]/, '').to_f
        thy_prices << price
      end
    end
    if thy_prices == thy_prices.sort
      GeneralUtils.log_info "Turkish Airlines prices are sorted from lowest to highest."
    else
      raise "Error: Turkish Airlines prices are not sorted from lowest to highest!"
    end
  end

  def select_flight_item
    GeneralUtils.wait_until_visible(:css, @success_button_css)
    first(@success_button_css).click
    find(@select_proceed_button_css).click
    GeneralUtils.log_info "First flight item selected."
  end

end