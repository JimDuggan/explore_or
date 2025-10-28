library(purrr)

x <- list(a=1:10, b=11:30)

my_max <- function(v){
  browser()
  max(v)
}

my_range <- function (x){
  max(x) - min(x)
}

map(x,min)

map_dbl(x,min)

map_dbl(x,my_range)
map_dbl(x,function(x)my_range(x))
map_dbl(x,function(x)max(x)-min(x))

map_dbl(x,~max(.x)-min(.x))



