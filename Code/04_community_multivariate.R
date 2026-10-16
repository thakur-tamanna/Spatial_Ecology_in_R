# Code for performing multivariate analysis with community data
# The vegan package will be used for multivariate part
# install.packages("vegan")
library(vegan)


# Using the data inside vegan
data(dune)

# Looking inside the dataset
dune # whole dataset

# Looking at few rows
head(dune)

# Principle component analysis with vegan
multipca <- pca(dune)
multipca

# Principle component analysis without vegan
multivar <- prcomp(dune)
multivar

# Looking at the percentage of variance explained by principle component
summary(multipca)

# How much variability is explained by the first two components?
# Proportion of PC1: 0.2947
# Percentage of explained variability by PC1: 29.47%

# Exercise: calculate the percentage of explained variability by PC2
# Proportion of PC2: 0.2157
# PErcentage of PC2: 21.57%

# Exercise: we are going to make the graph with just two dimensions over the 20 original dimensions, what is the total variability explained by PC1 and PC2?
# Total variability explained
totvar= 29.47 + 21.57
totvar # 51.04

# Make the final plot
plot(multipca)











