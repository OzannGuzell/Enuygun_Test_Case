search_page = SearchPage.new

And(/^select flight item$/) do
  search_page.select_flight_item
end

When('filter departure times between "10:00" and "18:00"') do
  search_page.filter_departure_times
end

Then('all listed flights should have departure times within "10:00" and "18:00"') do
  search_page.verify_listed_flights
end

Then('the prices of Turkish Airlines flights should be displayed in increasing order') do
  search_page.verify_prices_turkish_airlines
end
