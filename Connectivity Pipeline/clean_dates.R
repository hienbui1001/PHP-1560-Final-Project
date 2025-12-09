#' Cleaning Dates for Connectivity
#' 
#' @description This function is meant to clean the raw data to put the 
#' Times in POSIXct form and clear out unneccesary info
#' @param1 raw_data a data frame that contains all the simulated ripta data
#' that is located in the main folder of the GitHub repository
#' @return This function returns a data frame with Trip, Route, Stop Number, 
#' and POSIXct Date_Time

source("~/GitHub/PHP-1560-Final-Project/Pipeline/clean_data.R")

clean_dates <- function(raw_data) {
  
  clean_dates <- raw_data %>%
    select(Time, Route, Stop.Number, Trip) %>%
    mutate(Date_Time = mdy_hm(Time)) %>%
    filter(!is.na(Date_Time)) %>%
    distinct(Trip, Route, Stop.Number, Date_Time) %>%
    arrange(Date_Time)
  
  return(clean_dates)
}
