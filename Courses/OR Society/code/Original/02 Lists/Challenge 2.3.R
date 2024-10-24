l <- list(1:4,list(2:4,c(T,F)),c("A","B"))

sum(l[[2]][[1]])+sum(l[[2]][[2]])

v1 <- c(l[[1]],l[[2]][[1]],l[[2]][[2]],l[[3]])

v2 <- unlist(l)


# Based on the list:
#   Extract the 2nd list element, and calculate the sum of its elements. 
#   What do you expect the sum to be?
#     
#   Convert the entire list to a vector and predict what the 
#   vector type will be
