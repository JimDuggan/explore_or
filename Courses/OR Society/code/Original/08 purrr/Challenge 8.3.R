# Generate the following tibble from aimsir17::observations
library(aimsir17)
library(purrr)

observations %>%
  map_df(~{
    browser()
    tibble(class = class(.x),
           length = length(.x),
           ndistinct = n_distinct(.x))
  },.id="Column")

stations %>%
  map_df(~{
    tibble(class = class(.x),
           length = length(.x),
           ndistinct = n_distinct(.x))
  },.id="Column")

eirgrid17 %>%
  map_df(~{
    tibble(class = class(.x),
           length = length(.x),
           ndistinct = n_distinct(.x))
  },.id="Column")


