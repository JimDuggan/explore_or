library(dplyr)

x <- tibble(
  name = c("John", "Paul", "George", "Ringo", "Stuart", "Pete"),
  instrument = c("guitar","bass","guitar","drums","bass","drums")
)

y <- tibble(
  name = c("John", "Paul", "George", "Ringo", "Brian"),
  band = c(T,T,T,T,F)
)


inner_join(x,y)

left_join(x,y)

semi_join(x,y)

anti_join(x,y)
