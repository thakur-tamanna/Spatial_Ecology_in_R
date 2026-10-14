# Script for modelling the dispersion of individuals of a popultion

# New packages to be installed:
# install.packages("terra")
# install.packages("sdm")

# Check the packages
library(terra)
library(sdm)

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
