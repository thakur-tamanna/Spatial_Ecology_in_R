# R code for developing ecosystem monitoring in different times

# Packages
library(terra)
library(imageRy)
library(patchwork)
library(viridis)

# Listing data
im.list()

# European nitrogen
EN01 <- im.import("EN_01.png")
EN01 <- flip(EN01)
plot(EN01)

# Exercise: import and plot the final image
EN13 <- im.import("EN_13.png")
EN13 <- flip(EN13)
plot(EN13)

# Plloting the two situations one ontop of the other thanks to the patchwork package
p1 <- im.ggplot(EN01[[1]])
p2 <- im.ggplot(EN13[[1]])
p1 / p2

# Differencing images
diffEN <- EN01[[1]] - EN13[[1]]
difEN # info on the output
plot(diffEN)

# Plotting everything together
p3 <- im.ggplot(diffEN)
p1 + p2 + p3


#--------------

# Time serie analysis with several images at a time
# Exercise: import directly in a stack the NDVI data from 2020
ndvi <- im.import("NDVI_2020")

# Ridgeline plots
im.ridgeline(ndvi)

names(ndvi) <- c("02_feb", "05_may", "08_aug", "11_nov")
ndvi

 # Changing the scale parameter inside im.ridgeline()
im.ridgeline(ndvi, scale= 1)

# Changing the palette
im.ridgeline(ndvi, palette= "magma")

# Changing the direction of colors
im.ridgeline(ndvi, palette= "magma", direction= -1)

# -----------------

# Ice melt in Greenland

# Exercise: import the greenland data in a stack
gr <- im.import("greenland" )

# Exercise : plot only temperature of 2000 with the inferno legend from the viridis package

plot(gr[[1]], col= inferno(100))

# changing ther direction of colors
plot(gr[[1]], col= inferno(100), direction= -1)

# Plotting the data from 2015
plot(gr[[4]], col= inferno(100))

# Differnece between 2000 and 2015
dif <- gr[[1]] - gr[[4]]
plot(dif)


# RGB plot with three different layers in time
# on the red = 2000, all of the parts becoming red will have high temperatures in 2000
# on the green = 2005, all of the parts becoming red will have high temperature in 2005

im.plotRGB(gr, r=1, g=2, b=4)

                        

