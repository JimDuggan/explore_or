my_add <- function(a,b){
  # browser()
  return(a+b)
  0
}

evens <- function (v){
  100
}

sqrt <- function(v){
  "Hello World"
}

odds <- function(v){
  v[v %% 2 == 1]
}

get_maxs <- function(l){
  # create the output vector (atomic)
  o_v <- vector(mode="numeric",
                length = length(l))
  
  for(i in seq_along(l)){
    o_v[i] <- max(l[[i]])
  }
  
  o_v
}

get_maxs_fn <- function(l,fn){
  # This is an example of a functional
  # A function that takes an input argument
  # that is itself a function
  # create the output vector (atomic)
  o_v <- vector(mode="numeric",
                length = length(l))
  
  for(i in seq_along(l)){
    o_v[i] <- fn(l[[i]])
  }
  
  o_v
}


l <- list(1:20,3:40)



