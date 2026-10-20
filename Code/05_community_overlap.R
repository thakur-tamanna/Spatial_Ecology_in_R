# Once we have seen how species are related to each other in space we can proceed to look at how they are related to each other in time

# library(overlap)

#Using the dataset
data(kerinci)

head(kerinci)
tail(kerinci)

# Getting summary of dataset
summary(kerinci)

# install.packages("igraph")
library(igraph)

# Circular time
circulartime <- kerinci$Time * 2 * pi

# Putting the circular time inside the dataset
kerinci$Timecirc <- kerinci$Time * 2 * pi

# Looking at the new column
head(kerinci)

# Subesetting the dataset with the selection of the species tiger
tiger <- kerinci[kerinci$Sps=="tiger",]
summary(tiger)

# Density plot of spreading of tiger in the area in different times
densityPlot(tiger$Timecirc)

# Alternative method: Create the time variable from the tiger dataset and use it in the calculations
tigertime <- tiger$Timecirc
densityPlot(tigertime)

# Selecting a column with not necessarily require the name:
#tigertime <- tiger[4]

# Exercise: select all the rows of the kerinci dataset with the species macaque
macaque <- kerinci[kerinci$Sps=="macaque",]

# Check the set
head(macaque)
# Exercise: how to be sure that only macaque species has been selected
summary(macaque) #lazy method

# Exercise: make the density plot of the macaque
macaquetime <- macaque$Timecirc
densityPlot(macaquetime)
# Fucked down here

# Overlap the two distributions
overlapPlot(tigertime, macaquetime) 

# Changing the graph
overlapPlot(tigertime, macaquetime, linetype= c(3,1))

# Changing the line colours
overlapPlot(tigertime,
            macaquetime,
            linetype= c(3,1),
            linecol=c("cyan", "coral"
                      )
            
