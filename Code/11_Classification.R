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
sunclass <- im.classify(sun, num_clusters=3)

# Seed 
sunclass <- im.classify(sun, num_clusters=3, seed=42) 
                        
# Importing data of matogrosso
# Exercise: import data of mato grosso and give them the names m1992 and m2006                        
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")                        

# Making multiframe
im.multiframe(1,2)
plot(m1992)
plot(m2006)    

# Flip the images towards north
m1992 <- flip(m1992)                        
m2006 <- flip(m2006)

# Classifying the matogrosso 1992 image:
m1992class <- im.classify(m1992, num_clusters=2)
# class 1: human 
# class 2: forest
                        
# Classify image of matogrosso 2006:
m2006class <- im.classify(m2006, num_clusters=2)                        
# class 1: forest 
# class 2: human  

# Frequency of pixels attaining to the classes of m 1992 class
f1992 <- freq(m1992class)
f1992
                        
# Calculating proportions
tot1992 <- ncell(m1992class)
tot1992                        

# Exercise: calculate the proportion of the two classes: f/t
prop1992 = f1992/tot1992

# Calculating percentages:
perc1992 = prop1992 * 100
                        
# forest: 83%
# human: 17%                        

# Repeating the process for m2006 class
# Frequency of pixels attaining to the classes of m 1992 class
f2006 <- freq(m2006class)
f2006
                        
# Calculating proportions
tot2006 <- ncell(m2006class)
tot2006 
                        
# Exercise: calculate the proportion of the two classes: f/t
prop2006 = f2006/tot2006

# Calculating percentages:
perc2006 = prop2006 * 100                        
class 2 : 55%  
class 1 : 45%

# Creating the dataframe
class <- c("Forest", "Human")
perc1992 <- c(83, 17)
perc2006 <- c(45, 55)
                        
tabout <- data.frame(class, perc1992, perc2006)

# install.packages("ggplot2")
# install.packages("patchwork")
                        
# library(ggplot2)

# Plotting stats
 ggplot(tabout, aes(x= class, y= perc1992, color= class)) +
                        geom_bar(stat= "identity", fill= "white")

# Do the same plot for 2006:
ggplot(tabout, aes(x= class, y= perc2006, color= class)) +
                        geom_bar(stat= "identity", fill= "white")
