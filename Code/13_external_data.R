# Example code to download external data and upload them to R

#packages
library(terra)
# Linux
setwd("~/Downloads")

# Mac
setwd("/Users/tamanna/Downloads")
# Mac users can also use tilde '~'

# Check your working directory
getwd() 

# Importing the image
moon <- rast("cq5dam.web.1280.1280.jpeg")
moon

# Plot the image
plotRGB(moon, 1, 2, 3, stretch= "lin")

plotRGB(moon, 1, 3, 2, stretch= "lin")



