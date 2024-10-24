library(tidyr)
library(purrr)
library(dplyr)

mpg_nested <- mpg %>%
              group_by(class) %>%
              nest()

mpg_nested %>% pluck("data", 1)

lm_mpg <- mpg_nested %>% 
              mutate(lm_obj = map(data, 
                                  ~lm(cty ~ displ,data = .)))

lm1 <- lm_mpg %>% pluck("lm_obj",1)



mpg_models<- mpg %>%
              group_by(class) %>%
              nest()    %>% 
              mutate(lm_obj = map(data, 
                                  ~lm(cty ~ displ,data = .)))

mods <- pull(mpg_models,"lm_obj")
mods[[5]]




