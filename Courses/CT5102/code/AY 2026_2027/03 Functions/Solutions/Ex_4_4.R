# What will be the output from the following 
# function call?

a <- 100

env_test <- function(b,c=20){ 
  browser()
  a+b+c
}

env_test(1)