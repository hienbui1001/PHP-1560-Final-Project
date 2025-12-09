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
  graph <- ggplot(optimal_day,
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
  print(graph)
}

#Route visualization function: This function will allow us to view what routes
#struggle across all days.
route_graphs <- function(optimal){
  
  #format the data for specific routes
  optimal_route <- optimal %>%
    group_by(Route) %>%
    summarize(optimize_count = sum(optimize_count)) %>%
    mutate(Route = factor(Route))
  
  #Split table into positive and negative
  few_direct_routes <- optimal_route %>%
    filter(optimize_count > 0)
  
  not_connected <- optimal_route %>%
    filter(optimize_count < 0)
  
  #plot stations that need more direct routes
  few <- ggplot(few_direct_routes)+
    geom_col(aes(x = Route,
                   y = optimize_count),
             color = "darkgreen",
             fill = "lightgreen")
  
  #plot stations that need better connections
  conn <- ggplot(not_connected)+
    geom_col(aes(x = Route,
                 y = optimize_count),
             color = "red",
             fill = "pink")
print(few)
print(conn)
}

#Day paired with Route Visualization Function: This function will allow us to
#view specifically what routes struggle on what days using a geom_tile. This will
#only give us a general overview.
dxr_graph <- function(optimal){
  
  #format data so that it can be made into heat map
  dxr_table <- optimal %>%
    mutate(Day.of.Week = factor(Day.of.Week,
                                levels = 1:7,
                                labels = c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")),
           Route = factor(Route))
  
  #Plot the data
  graph <- ggplot(dxr_table,
         aes(x = Route,
             y = Day.of.Week,
             fill = optimize_count)) +
           geom_tile()+
           scale_fill_gradient2(low = "red",
                                mid = "white",
                                high = "blue")
  print(graph)
}