xs <- list(el1=1:5,el2=c(T,F),el3=100:110)

# Method 1
ans1 <- lapply(xs, function(x){
  browser()
  x
})

# Method 2
ans2 <- lapply(seq_along(xs), function(y){
  browser()
  xs[[y]]
})

# Method 3
ans3 <- lapply(names(xs), function(z,a){
  browser()
  xs[[z]]*a
},100)

