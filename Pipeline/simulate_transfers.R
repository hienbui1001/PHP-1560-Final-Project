simulate_transfers <- function(prop_table, n = 1000, size = 200) {
  
  # Empty vectors
  day_vec <- c()
  route_vec <- c()
  prop_vec <- c()
  sim_prop_vec <- c()
  
  for(i in 1:nrow(prop_table)) {
    
    p <- prop_table$proportions[i]
    day <- prop_table$Day.of.Week[i]
    route <- prop_table$Route[i]
    
    # binomial simulations for route/day pair
    pair_sims <- rbinom(n, size, prob = p) / size
    
    # repeat day/route pairs n times
    day_vec <- c(day_vec, rep(day, n))
    route_vec <- c(route_vec, rep(route, n))
    prop_vec <- c(prop_vec, rep(p, n))
    sim_prop_vec <- c(sim_prop_vec, pair_sims)
  }
  
  simulate_transfers <- data.frame(
    Day.of.Week = day_vec,
    Route = route_vec,
    proportions = prop_vec,
    simulated_prop = sim_prop_vec
  )
  
  return(simulate_transfers)
}
