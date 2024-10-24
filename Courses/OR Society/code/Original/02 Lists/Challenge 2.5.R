# Write a function that takes in a vector and returns 
# a vector with no duplicates. 
# Make use of the R function duplicated()

clean <- function(v){
  v[!duplicated(v)]
}

v <- c(1:5,rep(3,2))

ans <- clean(v)
