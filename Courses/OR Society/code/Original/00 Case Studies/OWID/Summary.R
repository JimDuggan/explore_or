library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)


d <- read_xlsx("datasets/OurWorldInData/201024 owid-covid-data.xlsx")

d <-  mutate(d, date=ymd(date),
             month=month(date,label = T))

d %>% filter(continent=="Europe",month>"Sep") %>% 
         group_by(month,location) %>% 
         summarise(MinR=min(reproduction_rate,na.rm=T),
                 MaxR=max(reproduction_rate,na.rm=T)) %>% 
         arrange(desc(MaxR)) -> test
