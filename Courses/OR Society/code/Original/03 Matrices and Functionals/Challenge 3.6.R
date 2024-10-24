# code a quadratic equation
# Use the interval [-10,10] for x, and the 
# seq() function to generate the values in steps of 0.1
# Generate the response f(x) by calling sapply()
# Plot the response using qplot()

library(ggplot2)

x<- seq(-10,10,.1)

y <- sapply(x,function(x1,a,b,c){
  # browser()
  a*x1^2+b*x1+c
}, 4, -2, 10)

y1 <- lapply(x,function(x1,a,b,c){
  # browser()
  a*x1^2+b*x1+c
}, 4, -2, 10)

qplot(x,y)
qplot(x,y1)

