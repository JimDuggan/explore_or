library(tidyverse)

mpg %>% select(manufacturer)

mpg %>% pull(manufacturer)

head(pull(mpg))

head(pull(mpg,1))

head(pull(mpg,-1))

x <- 1:35
y <- case_when(
  x %% 35 == 0 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  TRUE ~ as.character(x)
)


starwars %>%
  select(name:mass, gender, species) %>%
  mutate(
    type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid"        ~ "robot",
      TRUE                      ~  "other"
    )
  )




