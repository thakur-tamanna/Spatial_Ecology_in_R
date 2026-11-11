# R code for classifying images thanks to k-means:
# https://github.com/ducciorocchini/Spatial_Ecology_in_R_2026/blob/main/kmeans.md

# packages
library(terra)
library(imageRy)

# List of the data
im.list

# Exercise: Import the solar orbit image and give and assign it to object called "sun"
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Classifying the data
sunclass <- im.classify(sun, num_clusters=3

# Seed 
sunclass <- im.classify(sun, num_clusters=3, seed=42) 
                        
