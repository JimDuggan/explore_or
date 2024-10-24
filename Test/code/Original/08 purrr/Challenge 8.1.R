# Start with the tibble mpg
# Select the columns cty, hwy and displ
# Get the mean values for each of these, 
# using map(), map_dbl() and also map_chr()
library(dplyr)
library(purrr)
library(ggplot2)


mpg %>% select(displ,cty,hwy) %>%
     map(mean) -> l1

mpg %>% select(displ,cty,hwy) %>%
  lapply(mean) -> l1

mpg %>% select(displ,cty,hwy) %>%
  sapply(mean) 

mpg %>% select(displ,cty,hwy) %>%
  map_dbl(mean)

mpg %>% select(displ,cty,hwy) %>%
  map_chr(mean)
