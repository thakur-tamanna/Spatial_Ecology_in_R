# Code to develop graphs from species as nodes
install.packages("igraph")

library(igraph)


# *** The nodes (same names as in the interactions)
species <- c("Algae", "Zooplankton", "Aphia minuta", "Cyprinus carpio", "Larus")

# The interactions
predator <- c("Zooplankton", "Aphia minuta", "Cyprinus carpio", "Larus", "Larus")
prey <- c("Algae", "Zooplankton", "Aphia minuta", "Aphia minuta", "Cyprinus carpio")

# Dataframe with predators and preys
interactions <- data.frame(predator, prey)

# *** Building the graph 
graph <- graph_from_data_frame(interactions, vertices = data.frame(name = species))
plot(graph)

# The graph will maintain the same interactions but with a different representation!!
# The seed !!
set.seed(42)
graph <- graph_from_data_frame(interactions, vertices = data.frame(name = species))
plot(graph)


# install_github("accountname/nameofthepackage")
# R alternative are : remotes, devtools available in R



