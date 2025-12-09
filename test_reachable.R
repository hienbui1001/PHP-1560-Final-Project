source("~/GitHub/PHP-1560-Final-Project/reachable_stops.R")

clean_dates <- clean_dates(raw_data)

reachable_stops(
clean_dates,
start_stop = 23125,
start_time = "2024-05-01 04:56:00",
max_minutes = 10)

reachable_stops(
clean_dates,
start_stop = 23540,
start_time = "2024-05-07 12:13:00",
max_minutes = 25)

reachable_stops(
clean_dates,
start_stop = 24080,
start_time = "2024-05-15 08:21:00",
max_minutes = 5)