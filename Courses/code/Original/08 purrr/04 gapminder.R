library(purrr)
library(dplyr)
library(gapminder)


gapminder %>% map_chr(class)

gapminder %>% map_dbl(n_distinct)

gapminder %>% 
  map_df(~(tibble(n_distinct = n_distinct(.x),
                  class = class(.x))))


gapminder %>% 
  map_df(~(tibble(n_distinct = n_distinct(.),
                  class = class(.))))

gapminder %>% 
  map_df(~(tibble(n_distinct = n_distinct(.x),
                  class = class(.x))),
         .id="variable")

