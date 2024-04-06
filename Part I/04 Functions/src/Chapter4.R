# Chapter 4: Functions, Functionals, and the R Pipe


# A function that returns the even values from a vector
evens <- function(v){
  v[v%%2==0]
}

x1 <- 1:7

evens(x1)


# A function to remove duplicates from a vector
my_unique <- function(x){
  # Use duplicated() to create a logical vector
  dup_logi <- duplicated(x)
  # Invert the logical vector so that unique values are set to TRUE
  unique_logi <- !dup_logi
  # Subset x to store those values are unique
  ans <- x[unique_logi]
  # Evaluate the variable ans so that it is returned
  ans
}

set.seed(100)
v <- sample(1:6,10,replace = T)
ans <- my_unique(v)
ans


# Error checking using functions

evens <- function(v){
  if(length(v)==0)
    stop("Error> exiting evens(), input vector is empty")
  else if(!is.numeric(v))
    stop("Error> exiting evens(), input vector not numeric")
  v[v%%2==0]
}

# Robustness test 1, check for empty vector
t1 <- c()
evens(t1)

# Robustness test 2, check for non-numeric vector
t2 <- c("This should fail")
evens(t2)

# Robustness test 3, check for non-atomic vector
t3 <- list(1:10)
evens(t3)

# Robustness test 4, should work ok
t4 <- 1:7
evens(t4)



# Functionals with `lapply()`

l_in <- list(1:4,11:14,21:24)
l_out <- lapply(l_in,mean)
str(l_out)

library(repurrrsive)
# Search for movies by George Lucas and store these in a new list
target      <- "George Lucas"

# Call lapply to return a list of logical vectors
is_target   <- lapply(sw_films,function(x)x$director==target)

# Convert this list to an atomic vector, which is needed for filtering
is_target   <- unlist(is_target)

# Filter the list to contain the George Lucas movies
target_list <- sw_films[is_target]
length(target_list)
