library(gapminder)

gapminder %>% map_chr(~{
  browser()
  class(.)
})