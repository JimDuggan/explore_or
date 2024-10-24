# Use do.call() to call the following functions, 
# where x <- 1:10 and y <- 11:20
# min(x), min(y)
# add(x,y) which adds the two vectors 
# together (you need to write the add function)


x <- 1:10
y <- 11:20

args1 <- list(x)
do.call(min,args1)

args2 <- list(v=y)
do.call(min,args2)

add <- function(v1, v2){
  v1 + v2
}

add(x,y)

args3 <- list(v1=x,v2=y)
do.call(add, args3)


