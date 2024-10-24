library(purrr)

addTen <- function(.x) {
  cat("Calling addTen with .x=",.x,"\n")
  .x + 10
}

map(.x = c(1, 4, 7), 
    .f = addTen)

map(list(1,4,7),addTen)

map(c(1,4,7),function(.x).x+10)

map(list(1,4,7),function(.x).x+10)



map_dbl(c(1,4,7),function(.x).x+10)

map_chr(c(1,4,7),function(.x).x+10)

map_df(c(1,4,7),function(.x){
  tibble(Old=.x,New=.x+10)
})


