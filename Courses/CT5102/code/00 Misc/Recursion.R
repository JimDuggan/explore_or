# Print the environments starting 
# at the global environment

list_env <- function(env=globalenv()){
  print(env)
  
  if(identical(env,emptyenv())){
    stop("Reached emptyenv",call. = FALSE)
  }
  else{
    list_env(parent.env(env))
  }
}

process <- function(a){
  cat("\tprocess value ",a,"\n")
  if (a == 1)
    return(1)
  return (a + process(a-1))
}

n <- 5
while (n > 0){
  answer <- process(n)
  cat("calculating ",n,"gives ",answer,"\n")
  n <- n - 1
}



