l <- list(1:20,3:40)

a <- unlist(lapply(l,min))


titles <- lapply(sw_films,function(x){
  # browser()
  c(x$title,x$director)
})
