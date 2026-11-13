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
# Changing the fill color
ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="yellow")

# Changing the geometry
# Points
ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_point()

# Exercise: do the same for 2006
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")

# Using the patchwork package to plot several plots together
# Assign the plots to objects
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white")

p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") 

p1 + p2

# Exercise: with patchwork, put one plot ontop of the other
p1 / p2

# Changing the scale of the data
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p1 + p2

# Removing one legend
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100)) + 
  theme(legend.position = "none")


p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p1 + p2

# Using patchwork with satellite data
im.ggplot(m1992[[1]])
im.ggplot(m2006[[1]])

# Plotting satellite data and stats together
s1 <- im.ggplot(m1992[[1]])
s2 <- im.ggplot(m2006[[1]])

# Final plot
(s1 | s2) /
(p1 | p2) 

# Doing the same with RGB images
rgb1 <- im.ggplotRGB(m1992)
rgb2 <- im.ggplotRGB(m2006)

# Final plot
(rgb1 | rgb2) /
(p1 | p2) 
