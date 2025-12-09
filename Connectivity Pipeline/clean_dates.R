
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
