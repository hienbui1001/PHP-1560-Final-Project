library(tidyverse)
library(lubridate)

raw_data <- read.csv("[insert ripta data here]")
#' Clean data
#' 
#' @description Takes in raw data and filters it down to our needs
#'
#' @param raw_data Dataframe, dataframe including typical RIPTA data 
#' @return cleaned_data, named RIPTA data for convenience
clean_data <- function(raw_data){
  raw_data %>%
  select(Day.of.Week, Route, Stop.Number, Trip, Ride.Count, Transfer) %>%
  mutate(Day.of.Week = factor(Day.of.Week,
                              levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")))
}