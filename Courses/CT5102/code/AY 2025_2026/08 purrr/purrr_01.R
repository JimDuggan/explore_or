library(purrr)
library(dplyr)
library(repurrrsive)
library(ggplot2)

# The map function
o1 <- purrr::map(c(1,2,3,2,1),function(x)x^2) 
o11 <- lapply(c(1,2,3,2,1),function(x)x^2) 
str(o1)

test <- map(c(1,2,3),~{
  browser()
  .x^2
})

o2 <- purrr::map(c(1,2,3,2),~.x^2) 
str(o2)

o3 <- purrr::map(c(1,2,3,2),~.^2) 
str(o3)

# map functions that return atomic vectors

mtcars %>%
  select(mpg,cyl,disp) %>%
  map_dbl(mean)

sw_films %>%
  map_chr(~.x$director) %>%
  unique()


mpg %>%
  select(manufacturer:cyl) %>%
  map_lgl(function(x)is.numeric(x))

mpg %>% 
  select(displ,cty,hwy) %>% 
  map_int(~sum(.x>mean(.x)))

sw_films %>% 
  map_df(~tibble(ID=.x$episode_id, 
                 Title=.x$title, 
                 Director=.x$director, 
                 ReleaseDate=as.Date(.x$release_date))) %>%
  arrange(ID)


# map2 functions (they take 2 arguments)
means <- c(10,20,30) 
sds <- c(2,4,7)

map2(means,sds,~rnorm(5,.x,.y)) %>% 
  str()

# pmap function
params <- list(means = c(10,20,30), 
               sds = c(2,4,7), 
               n = c(4,5,6)) 

pmap(params, ~rnorm(n=..3,
                    mean = ..1,
                    sd = ..2)) %>%
  str()

pmap_dbl(select(mpg,cty,hwy),~sum(..1+..2))

