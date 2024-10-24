x <- 20

f <- function(){
  y <- 25
  # this function has read access to its global environment
  c(x,y,z)
}