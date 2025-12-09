#here I write the function to present the visualizations of the code
#loading in necessary plotting library
library(ggplot2)

#Day visualization function: This function will allow us to view what days might
#struggle the most with optimization
day_graph <- function(optimal){
  
  #format the data for specific days
  optimal_day <- optimal %>%
    group_by(Day.of.Week) %>%
    summarize(optimize_count = sum(optimize_count))%>%
    mutate(Day.of.Week = case_when(
      Day.of.Week == 1 ~ "Mon",
      Day.of.Week == 2 ~ "Tue",
      Day.of.Week == 3 ~ "Wed",
      Day.of.Week == 4 ~ "Thu",
      Day.of.Week == 5 ~ "Fri",
      Day.of.Week == 6 ~ "Sat",
      Day.of.Week == 7 ~ "Sun"
    ),
    #Had to add this in too order the days of the week
    Day.of.Week = factor(
      Day.of.Week,
      levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")))
  
  #plot this on a graph
  ggplot(optimal_day,
         aes(x = Day.of.Week,
             y = optimize_count,
             group = 1)) +
    geom_line(color = "blue") +
    geom_point(color = "red") +
    geom_text(aes(label = optimize_count), nudge_x = 0.5)+
    labs(
      title = "Optimization Needed Based on Day of the Week",
      x = "Day",
      y = "Optimization Count") 
}

#Route visualization function: This function will allow us to view what routes
#struggle across all days
route_graph <- function(optimal){
  
  #format the data for specific days
  optimal_route <- optimal %>%
    group_by(Route) %>%
    summarize(optimize_count_total = sum(optimize_count))
}

#Day paired with Route Visualization Function: This function will allow us to
#view specifically what routes struggle on what days
dr_graph <- function(optimal){
  
}