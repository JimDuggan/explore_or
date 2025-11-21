# A first-in first-out queue, Implemented using S3
# Note that we use the existing generic function print as part of our solution
# The S3 object that we create is based on the class "queue"
# We add two new generic functions (arrival and departure) and add methods for these


# First, we write the constructor
queue <- function(name){
  q <- list(name=name,
            contents=c(),
            length=0,
            left=c())
  class(q) <- "queue"
  q
}

# Create a queue object. It's a list, with a number of elements. It is also an S3 object.
# See the attribute class has been set
q1 <- queue("Queue1")
str(q1)

# Our first method, using the generic function print 
print.queue <- function(q){
  cat("Queue = ", q$name,"\n")
  cat("Contents = <", q$contents,">\n")
  cat("Size = ", q$length,"\n")
  cat("Left = ", q$left)
}

# See all the methods associated with print
methods("print")
which(methods("print") == "print.lm")
which(methods("print") == "print.queue")

q1


# Create two new generic functions that can be used by "queue"
arrival <- function(q,e){
  UseMethod("arrival")
}

departure <- function(q){
  UseMethod("departure")
}


# Create methods for the generic functions
arrival.queue <- function(q,e){
  q$contents <- c(e,q$contents)
  q$length <- length(q$contents)
  # return the new state
  q 
}

# See all the methods associated with arrival
methods("arrival")


departure.queue <- function(q){
  q$left <- c(q$left,q$contents[length(q$contents)])
  q$contents <- q$contents[-(length(q$contents))]
  q$length <- length(q$contents)
  # return the new state
  q
}

# See all the methods associated with departure
methods("departure")


# Work through an example - note that we always return the new state

# P1 arrives
q1 <- arrival(q1, "P1")
q1

q1 <- arrival(q1, "P2")
q1

q1 <- arrival(q1, "P3")
q1

q1 <- arrival(q1, "P4")
q1

q1 <- departure(q1)
q1

q1 <- departure(q1)
q1

q1 <- departure(q1)
q1

q1 <- departure(q1)
q1




# A final example - check for understanding
# Think also of R's hierarchy, starts with the global environment
library(ggplot2)
mod1 <- lm(cty~displ,data=mpg)
summary(mod1)

summary.lm <- function(o){
  cat("Hello World\n")
}

summary(mod1)

