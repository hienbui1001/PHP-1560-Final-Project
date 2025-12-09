source("~/GitHub/PHP-1560-Final-Project/clean_dates.R")

reachable_stops <- function(clean_dates, start_stop, start_time, max_minutes = 30) {
  
  # next bus at this stop
  next_bus <- clean_dates %>%
    filter(Stop.Number == start_stop,
           Date_Time >= start_time) %>%
    slice_min(Date_Time, n = 1)
  
  # no bus found
  if (nrow(next_bus) == 0) {
    return("No buses found after the selected time.")
  }
  
  trip_id <- next_bus$Trip
  depart_time <- next_bus$Date_Time
  
  # reachable stops in trip
  reachable <- clean_dates %>%
    filter(Trip == trip_id) %>%
    mutate(mins = as.numeric(difftime(Date_Time, depart_time, units = "mins"))) %>%
    filter(mins >= 0, mins <= max_minutes) %>%
    select(Route, Stop.Number, Date_Time, mins)
  
  return(reachable)
}
