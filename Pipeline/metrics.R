#This script builds functions in order to find metrics for the cleaned Data
library(dplyr)

metric <- function(ripta_data){
  #Focusing on week days an specific routes and summarizing for transfers
  prop_table <- ripta_data %>%
    group_by(Day.of.Week, Route)%>%
    summarise(proportions = sum(Transfer)/sum(Ride.Count)) %>%
    mutate(Day.of.Week = case_when(
      Day.of.Week == "Mon" ~ 1,
      Day.of.Week == "Tue"   ~ 2,
      Day.of.Week == "Wed" ~ 3,
      Day.of.Week == "Thu"  ~ 4,
      Day.of.Week == "Fri"    ~ 5,
      Day.of.Week == "Sat"  ~ 6,
      Day.of.Week == "Sun"    ~ 7
    ))
  
  return(prop_table)
}
