library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)

d <- read_xlsx("datasets/OurWorldInData/201024 owid-covid-data.xlsx")

t <- c("Ireland","New Zealand", "Sweden","United States","Germany",
       "Spain")

d1 <- d %>% 
  filter(continent == "Europe",
         reproduction_rate > 0) %>% 
  select(date, 
         location, 
         continent,
         new_cases_smoothed, 
         reproduction_rate) %>%
  group_by(location) %>%
  mutate(prev_cases=lag(new_cases_smoothed),
         prev_rr=lag(reproduction_rate),
         diff_cases=new_cases_smoothed-prev_cases,
         gr_cases=100*diff_cases/prev_cases,
         diff_rr=reproduction_rate-prev_rr,
         gr_rr=100*diff_rr/prev_rr) %>%
  ungroup() %>%
  filter(complete.cases(.))
