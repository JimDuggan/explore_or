# Chapter 1: Getting Started with R

# Assign 25 to  x
x <- 25
# Display x
x
# Add 21 to x and store the result y
y <- x + 25
# Display y
y


# Call the function c() 
# Store the result in the variable v
v <- c(10, 20, 30)
# Display v
v

sum(v)
mean(v)
sqrt(v)


# install.packages("aimsir17")



library(aimsir17)
library(ggplot2)

head(stations)


p1 <- ggplot(mtcars,aes(x=disp,y=mpg))+
  geom_point()+
  geom_smooth(method="lm",se = F)+
  labs(title="A simple regression example in R",
       subtitle = "Data points for 32 automobiles showing the line of best fit",
       x="Displacement (cubic inches)",
       y="Miles per gallon")


X <- mtcars$disp
X

Y <- mtcars$mpg
Y


mod <- lm(Y~X)
coefficients(mod)



cor(Y,X)













