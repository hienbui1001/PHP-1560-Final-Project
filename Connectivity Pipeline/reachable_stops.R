#' Reachable Stops
#' 
#' @description This function is meant to find all of the stops that a RIPTA 
#' rider can reach from their inputted origin information
#' @param1 clean_dates a data frame that with Trip, Route, Stop Number, 
#' and POSIXct Date_Time
#' @param2 start_stop a value that is the stop that the rider will start from
#' @param3 start_time a POSIXct formatted value that is the date and time that
#' the rider will start at
#' @param4 max_minutes a positive value that is the maximum amount of time a 
#' rider will take to get to a stop
#' @return This function returns a data frame that has Trip,Stop Number
#' Date_Time, and mins (time it takes to get to that stop)

source("~/GitHub/PHP-1560-Final-Project/Connectivity Pipeline/clean_dates.R")

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
