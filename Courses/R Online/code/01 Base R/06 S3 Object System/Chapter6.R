# Chapter 6: The S3 Object System in R

# Showing S3 in action
mod <- lm(mpg~disp,data=mtcars)
summary(mod)

d <- subset(mtcars,select=c("mpg","disp")) |> head()
summary(d)

# Defining attributes in R

x1 <- 1:5
attr(x1,"test") <- "Hello World"
attr(x1,"test")
attributes(x1)


# The names attribute

x2 <- 1:5
attr(x2,"names") <- LETTERS[1:5]
attributes(x2)
x2

# The dim attribute
# Create a vector of 4 elements
m1 <- 1:4
m1
# Set the "dim" attribute to 2x2 matrix
attr(m1,"dim") <- c(2,2)
m1
attributes(m1)
# Set the "dim" attribute to 1x4 matrix
attr(m1,"dim") <- c(1,4)
m1
attributes(m1)



# The class attribute... defines S3 classes

# Show the class attribute using attr
attr(mtcars,"class")
# Show the class attribute using class
class(mtcars)

# Setting the class attribute
v <- list(a=1,b=2,c=3)
class(v) <- "my_test"
attributes(v)

# Using a constructor function
new_my_test <- function(l){
  class(l) <- "my_test"
  l
}

obj <- new_my_test(list(a=1,b=2))
class(obj)

# Generic function summary() - Redefining summary.lm() to add in the global environment
summary.lm <- function(o)
{
  "Hello world!"
}
# Show the output from the new version of summary.lm
summary(mod)
# Remove the function from the global environment
rm(summary.lm)

# Showing methods that use summary
m_list <- methods("summary")
length(m_list)
m_list[1:5]
which(m_list=="summary.data.frame")
which(m_list=="summary.lm")


# define an atomic vector
v <- c(10.1, 31.2)
# Show v at the console
v
# Add a class attribute
class(v) <- "my_new_class"

# Implement our print method for this class, and load.
print.my_new_class <- function(o){
  cat("Hello World!\n")
}
# Show v again at the console
v
