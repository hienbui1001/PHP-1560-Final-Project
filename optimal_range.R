#Optimal Range Function
optimal_range <- function(sim_data) {
  
  #Find bounds for each day: This provides reasonable bounds to test route proportions against
  metric_mm <- sim_data %>%
    group_by(Day.of.Week) %>%
    summarise(prop_min = min(proportions),
              prop_max = max(proportions))
  
  #initiate a table that counts transfer proportion success using a +- system
  optimal_range_df <- sim_data %>%
    select(Day.of.Week, Route)%>%
    group_by(Day.of.Week, Route) %>%
    summarise(n = n()) %>%
    select(-n) %>%
    mutate(optimize_count = 0)
  
  #test each simulated data piece against the min_max values
  for( i in 1:nrow(sim_data)){
    
    #Naming specific row variables
    d <- sim_data$Day.of.Week[i]
    r <- sim_data$Route[i]
    
    #naming a indexing values for optimizing table
    x <- optimal_range_df$Day.of.Week == d
    y <- optimal_range_df$Route == r
    
    #naming an indexing value for specific day of week
    n <- metric_mm$Day.of.Week == d
    
    #naming specific bounds
    upper <- metric_mm$prop_max[n]
    lower <- metric_mm$prop_min[n]
    
    #test each row against the bounds from metric_m
    if(sim_data$simulated_prop[i] > upper){
      
      #Adds a 1 value to represent fewer direct routes
      optimal_range_df$optimize_count[x & y] <- optimal_range_df$optimize_count[x & y] + 1

    }else if(sim_data$simulated_prop[i] < lower){
      
      #Subtracts a 1 value to represent low connectivity
      optimal_range_df$optimize_count[x & y] <- optimal_range_df$optimize_count[x & y] - 1
    }else{
      optimal_range_df$optimize_count[x & y] <- optimal_range_df$optimize_count[x & y]
    }
  }
  return(optimal_range_df)
}