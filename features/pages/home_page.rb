class HomePage
  def initialize
    @from_where_css = "[data-testid=endesign-flight-origin-autosuggestion-input]"
    @first_from_where_item_css = "[data-testid*='option-item-0']"
    @from_to_css = "[data-testid=endesign-flight-destination-autosuggestion-input]"
    @calendar_css = "#calendar-month-%s .sc-nZgfj .sc-fwwElh[data-day='%s']"
    @forward_button_css = "[data-testid*='forward-button']"
    @click_departure_date_css = "[data-testid*='enuygun-homepage-flight-departureDate']"
    @click_return_date_css = "[data-testid*='returnDate-input-comp']"
    @submit_button_css = "[data-testid*='submitButton']"
    @click_passenger_and_cabin_css = "[data-testid*='selectPassengerAndCabin']"
    @adult_count_css = "[data-testid*='adult-counter-count']"
    @adult_counter_plus_button_css = "[data-testid*='adult-counter-plus']"
    @child_count_css = "[data-testid*='child-counter-count']"
    @child_counter_plus_button_css = "[data-testid*='child-counter-plus-button']"
    @infant_count_css = "[data-testid*='infant-counter-count']"
    @infant_counter_plus_button_css = "[data-testid*='infant-counter-plus-button']"
    @economy_cabin_css = "[data-testid*='ekonomiCabin']"
    @business_cabin_css = "[data-testid*='businessCabin']"
    @done_button_css = "[data-testid*='doneBtn']"

  end

  def select_location(input_css, item_css, location)
    find(input_css).set(location)
    find(item_css, wait: 3).click
  end

  def search_round_trip_flights(from_where, to_where)
    select_location(@from_where_css, @first_from_where_item_css, from_where)
    GeneralUtils.log_info "#{from_where} Departure location selected"
    select_location(@from_to_css, @first_from_where_item_css, to_where)
    GeneralUtils.log_info "#{to_where} Arrival location selected"
  end

  def select_date_from_calendar(date, click_date_css)
    year_and_month = date.split("-")[0..1].join("-")
    day = date.split("-").last
    first(click_date_css).click
    Capybara.default_max_wait_time = 1
    while true
      if page.has_css?(@calendar_css % [year_and_month, day])
        find(@calendar_css % [year_and_month, day]).click
        break
      else
        if page.has_css?(@forward_button_css)
          find(@forward_button_css).click
        else
          GeneralUtils.log_info "Target date not found and cannot go any further"
          break
        end
      end
    end
  end

  def select_departure_return_date(departure_date, return_date)
    select_date_from_calendar(departure_date, @click_departure_date_css)
    select_date_from_calendar(return_date, @click_return_date_css) if return_date != ""
    GeneralUtils.log_info "#{departure_date} Departure and #{return_date} return dates have been selected."
  end


  def increase_count(current_count_css, target_count, counter_button_css)
    current_count = find(current_count_css).text
    while current_count < target_count
      find(counter_button_css).click
      current_count = find(current_count_css).text
    end
  end

  def select_passenger_count(adult_count, child_count, baby_count)
    total_passengers = adult_count.to_i + child_count.to_i
    raise "Error: The total number of passengers cannot exceed 9. Please check your scenario." if total_passengers > 9
    raise "Error: The number of infants cannot exceed the number of adults. Please check your scenario" if baby_count.to_i > adult_count.to_i
    find(@click_passenger_and_cabin_css).click
    increase_count(@adult_count_css, adult_count, @adult_counter_plus_button_css)
    increase_count(@child_count_css, child_count, @child_counter_plus_button_css)
    increase_count(@infant_count_css, baby_count, @infant_counter_plus_button_css)
    GeneralUtils.log_info "#{adult_count} adult #{child_count} child #{baby_count} babies were selected."
  end

  def select_cabin_class(cabin_class)
    cabin_css = cabin_class == "Economy" ? @economy_cabin_css : @business_cabin_css
    find(cabin_css).click
    GeneralUtils.log_info "#{cabin_class} class selected."
    find(@done_button_css).click
    find(@submit_button_css).click
  end

end