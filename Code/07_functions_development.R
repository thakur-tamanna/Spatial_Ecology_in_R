# This code will develop user based functions

# This is the first function
summa<- function(x,y){
z=x+y
return(z)
}

summa(3,5)

# Exercise: Build a function to multiply (*) two numbers

multiply <- function(x,y){
z=x*y
return(z)
}

multiply(2,8)

# Exercise: Develop your own function to make the sum of four numbers

foursumma<- function(w,x,y,z){
t=w+x+y+z
return(t)
}

foursumma(4,5,6,7)

# A very annoying situation is related to the par function which is difficult to understand

mf<- function(nx,ny){
 par(mfrow=c(nx,ny))
}

mf(1,2)
plot(3,5)
plot(6,7)

# Putting default values inside the functions    


mfdef <- function(nx=1,ny=2){
 par(mfrow=c(nx,ny))
}

mfdef()
plot(3,5)
plot(6,7)

# Plotting three or more objects
mfdef(3,1)
plot(1,2)
plot(3,4)
plot(5,6)

# Using the operators if else, to look if a number is positive or negative
amIpositive <- function(x){
if(x>0){
  print("This number is positive, are you drunk?")
  }
else{
print("This number is negative, idiot!")
  }
  }

amIpositive(98)

# Considering all the potential cases
amIpositive <- function(x){
if(x>0){
print("This number is positive, are you drunk?")
  }
else if(x<0){
print("This number is negative, idiot!")
  }
else if {
print("Zero is nor positive neither negative")
  }
}

# Developing for loops
loop <- function(){
  for (i in 1:10) {
    print(i)
    }
  }
loop()

# Exercise: develop a loop which will printn 13000 numbers from 1 to 13000
loop <- function(){
  for (i in 1:13000) {
    print(i)
    }
  }
  loop()

# Loop with an operation inside
loop2 <- function(){
  for(i in 1:10) {
    multi <- i * 4
    print(multi)
    }
  }

# Exercise: Make a loop with the power operator
loop2 <- function(){
  for(i in 1:10) {
    multi <- i ^ 4
    print(multi)
    }
  }
loop2()

# Making an output
sink("numbers.txt")
loop2()




