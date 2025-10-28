# Write a map function that takes in a list of elements, 
# and then returns (as an integer) 
# the number of elements in each list
# Use the ~ operator to perform the same task
library(purrr)


l <- list(a=1:100,b=1:1000,c=99:100)

l %>% sapply(function(x)length(x))

l %>% map_int(function(x){
  browser()
  length(x)})

l %>% map_int(~{
  browser()
  length(.x)
  })

l %>% map_int(~length(.))

map_int(l, ~length(.z))

sapply(l,function(x)length(x))
