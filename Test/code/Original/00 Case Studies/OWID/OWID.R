library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)

d <- read_xlsx("datasets/OurWorldInData/owid-covid-data.xlsx")

t <- c("Belgium","Ireland")

d1 <- d %>% 
         filter(location %in% t, date > "2020-02-29") %>% 
         select(date, 
                location, 
                new_cases,
                new_deaths,
                new_cases_per_million, 
                new_cases_smoothed,
                new_cases_smoothed_per_million,
                reproduction_rate) %>%
         mutate(date=ymd(date))


ggplot(d1,aes(x=date,y=new_cases_smoothed_per_million,colour=location))+
  geom_point()+geom_line()

ggplot(d1,aes(x=date,y=new_cases,colour=location))+
  geom_point()+geom_line()

ggplot(d1,aes(x=date,y=new_deaths,colour=location))+
  geom_point()+geom_line()

ggplot(d1,aes(x=date,y=reproduction_rate,colour=location))+
  geom_point()+geom_line()

ggplot(d1,aes(x=date,y=new_cases,colour=location))+geom_point()+geom_line()+geom_smooth()

ggplot(d1,aes(x=date,y=new_cases_per_million,colour=location))+geom_point()+geom_line()+geom_smooth()

ggplot(filter(d1,location=="Ireland"),aes(x=date,y=new_cases,colour=location))+
  geom_point()+geom_line()+geom_smooth()

