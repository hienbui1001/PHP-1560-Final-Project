#This script runs everything in order to reach the final analysis
source("Pipeline/clean_data.R")
source("Pipeline/metrics.R")
source("Pipeline/simulate_transfers.R")
source("Pipeline/optimal_range.R")
source("Pipeline/visualization.R")

#Below I am running the functions in order of how they should be run.
ripta_data <- clean_data(raw_data)
metrics <- metric(ripta_data)
sim_data <- simulate_transfers(metrics)
optimal <- optimal_range(sim_data)

#After the above functions are run, we have a couple different options to 
#visualize the data

#This function prints a graph that demonstrates what days struggle the most with
#transfers
day_graph(optimal)

#This function prints a graph that demonstrates what routes struggle the most with
#transfers. This function actually prints two different graphs that demonstrate
#the different needs of each station
route_graphs(optimal)

#Finally, the following function prints a general overlook of the relationship 
#between day, route, and optimization needs
dxr_graph(optimal)
