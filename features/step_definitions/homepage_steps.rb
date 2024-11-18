home_page = HomePage.new

And(/^open the homepage$/) do
  visit BaseConfig.base_url
end

And('search for round-trip flights from {string} to {string}') do |from_where,to_where|
  home_page.search_round_trip_flights(from_where,to_where)
end

And('select on {string} with return on {string}') do |departure_date,return_date|
  home_page.select_departure_return_date(departure_date,return_date)
end

And(/^select (.*) adult,(.*) child,(.*) baby and (.*) class$/) do |adult_count,child_count,baby_count,cabin|
  home_page.select_passenger_count(adult_count,child_count,baby_count)
  home_page.select_cabin_class(cabin)
end






