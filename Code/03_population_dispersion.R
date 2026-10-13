# Script for modelling the dispersion of individuals of a population

# New packages to be installed:
# install.packages("terra")
# install.packages("sdm")

# Check the packages with 
library(terra)
library(sdm)

# Path to the file
path <- system.file("external/species.shp", package= "sdm")

# Import the vector data
rana <- vect(path)
rana

# Plotting the data
plot(rana)

# Installing packages
install.packages("vegan")
install.packages("overlap")

# Import the vector data
rana<- vect(path)
rana

# Plotting the data
plot(rana)

# Looking at coordinates
coordinates <- geom(rana)

# Subset the dataset extracting presences
presence <- rana[rana$Occurence == 1]

# Exercise : select and assign absences
# Option 1:
absence <- rana[rana$Occurence == 0]
# Option 2:
absence <- rana[rana$Occurence != 1

# Plot the presences
plot(presence)

                
# Plot the absences
plot(absence)

                
# Exercise: plot presences and absences with different colours in the same plot
plot(presence, col= "blue", cex= 2.5)
points(absence, col= "violet", cex= 2.5)
                
                
                

