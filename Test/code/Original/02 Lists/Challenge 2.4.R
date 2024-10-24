# Write an R function that filters a vector to return 
# all the even numbers

x <- 100

f <- function(v){
  #browser()
  v[v %% 2 == 0]
}
