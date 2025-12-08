#This script builds functions in order to find metrics for the cleaned Data
library(dplyr)

metric <- function(ripta_data){
  #Focusing on week days an specific routes and summarizing for transfers
  prop_table <- ripta_data %>%
    group_by(Day.of.Week, Route)%>%
    summarise(proportions = sum(Transfer)/sum(Ride.Count))
  return(prop_table)
}
