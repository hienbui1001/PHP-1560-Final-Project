library(tidyverse)
library(lubridate)


ripta_data <- read.csv("ridership_simulated.csv")

ripta_data <- ripta_data %>%
  select(Day.of.Week, Route, Stop.Number, Trip, Ride.Count, Transfer) %>%
  mutate(Day.of.Week = factor(Day.of.Week,
                              levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")))
