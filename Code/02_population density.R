# R code for population density

# Installing packages
# install.packages("spatstat")

# Using the package(s)
library(spatstat)

# Recall the data
bei

# Looking at the points in space
plot(bei)

# Changing the pch
plot(bei, pch=15)

# Decrease the dimension
plot(bei, pch=15, cex=.5)

# Drivers
bei.extra

# Plotting variables
plot(bei.extra)


# Subsetting a dataset: NEW CONCEPT!
# There are two different methods to make a subset:
# first: name of the variable and $ symbol
# second: number of the layer and [] for tables, [[]] for map layers

elevation <- bei.extra$elev

# output
plot(elevation)

# output
plot(gradient)

# Subset by the number of the layer/ variable
elevation2 <- bei.extra[[1]]

# In case bei.extra was a table: bei.extra[1]

# Plot the new object

plot(elevation2)

# Creating our first map!
densitymap <- density(bei)

# Output
plot(densitymap)

# Plotting the points on top of the density map
points(bei, cex=.5)

# New Concept! : MULTIFRAME!
# Creating the multiframe
par(mfrow=c(1,2))
plot(elevation)
plot(densitymap)

# Exercise: Put the elevation map on top of the densitymap


par(mfrow=c(2,1))
plot(elevation)
plot(densitymap)
# IF you get any graphical issue here is your friend:
# dev.off()

# Changing colors in our maps
cl <- colorRampPalette(c("blue", "green", "red"))

 # Plot the density map and change its color thanks to cl
plot(densitymap, col= cl)

# Changing colors in our maps
cl <- colorRampPalette(c("magenta1", "green", "mediumpurple"))

# Nuances
cl3 <- colorRampPalette(c("magenta1", "green", "mediumpurple"))(3)
plot(densitymap, col= cl3)
cl10 <- colorRampPalette(c("magenta1", "green", "mediumpurple"))(10)
plot(densitymap, col= cl10)

cl100 <- colorRampPalette(c("magenta1", "green", "mediumpurple"))(100)
plot(densitymap, col= cl100)

# Exercise Make a mf with the map with 10 nuances on top of that with 100
par(mfrow=c(2,1))
plot(densitymap, col= cl10)
plot(densitymap, col= cl100)

# R colors are here:
# https://r-charts.com/colors/
