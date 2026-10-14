# Script for modelling the dispersion of individuals of a popultion

# New packages to be installed:
# install.packages("terra")
# install.packages("sdm")
# install.packages("viridis")
# Check the packages
library(terra)
library(sdm)
library(viridis) # https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html

# Path to the file
path <- system.file("external/species.shp", package="sdm")

# Import the vector data
rana <- vect(path)
rana

# Plotting the data
plot(rana)

# Looking at coordinates
coordinates <- geom(rana)

# SUBSET YOUR DATA!!!
# Subset the dataset extracting presences
presence <- rana[rana$Occurrence == 1] # take care of the capital letter!

# Exercise: select and assign absences
# option 1
absence <- rana[rana$Occurrence == 0]
# option 2
absence <- rana[rana$Occurrence != 1]

# Plot the presences
plot(presence)

# Plot the absences
plot(absence)

# Exercise: plot presences and absences with different colors in the same plot
plot(presence, col="blue", cex=2.5)
points(absence, col="violet", cex=2.5)

# Load the path to the elevation file
elev <- system.file("external/elevation.asc", package="sdm")

# Exercise: using the rast() function import the data
elevmap <- rast(elev)
plot(elevmap)

# Exercise: Change the colour of the map
cl<- colorRampPalette(c("red", "green", "yellow"))(100)
plot(elevmap, col=cl)
points(presence, cex=2)

# Exercise: import and plot temperature with the cl ramp palette
temp <- system.file("external/temperature.asc", package="sdm")
tempmap<- rast(temp)
tempmap
cl<- colorRampPalette(c("pink", "green", "yellow"))(100)
plot(tempmap, col=cl)
points(presence, cex=2)

# Exercise: import and plot precipitation with the cl ramp palette
pre <-system.file("external/precipitation.asc", package="sdm")
premap<- rast(pre)
plot(premap)
cl<- colorRampPalette(c("magenta", "green", "maroon"))(100)
plot(premap, col=cl)
points(presence, cex=2)


# Exercise: import and plot vegetation with the cl ramp palette
veg <-system.file("external/vegetation.asc", package="sdm")
vegmap<- rast(pre)
plot(vegmap)
cl<- colorRampPalette(c("magenta", "green", "maroon"))(100)
plot(vegmap, col=cl)
points(presence, cex=.5)


# PLotting the elevation map with viridis package
plot(elevmap, col=viridis(100))

plot(elevmap, col= mako(100))

# Exercise: Plot the four maps together in the same multiframe 
par(mfrow= c(2,2))
plot(elevmap, col= plasma(100))
plot(vegmap, col= plasma(100))
plot(premap, col= plasma(100))
plot(tempmap, col= plasma(100))

# to put titles in map
plot(elevmap, col= plasma(100), main= "elevation")
plot(vegmap, col= plasma(100), main= "vegetation")
plot(premap, col= plasma(100), main= "precipitation")
plot(tempmap, col= plasma(100), main= "temperature")


# Making a stack IMPORTANT CONCEPT!
drivers <- c(elevmap, tempmap, vegmap, premap)
drivers
plot(drivers, col= inferno(100))

# PLot a single driver from the stack
t <- drivers[[2]]
plot(t)
points(presence, cex= .5)

t <- drivers$temperature
plot(t)
points(presence, cex= .5)






