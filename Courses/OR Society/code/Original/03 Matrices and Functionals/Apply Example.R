m <- matrix(sample(1:9,9),ncol=3)

max_r <- apply(m,1,function(x){
  browser()
  max(x)
})

min_c <- apply(m,2,function(x){
  browser()
  min(x)
})
