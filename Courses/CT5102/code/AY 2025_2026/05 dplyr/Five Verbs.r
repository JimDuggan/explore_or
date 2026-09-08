library(dplyr)
library(ggplot2)
library(aimsir17)

stations %>% 
  filter(county=="Galway")

ob1 <- observations %>%
         select(station,date,rain) %>%
         filter(date>"2017-03-17") %>%
         filter(station=="MACE HEAD")

ob2 <- observations %>%
        select(station:rain,temp) %>%
        filter(month==3,day==17) %>%
        arrange(desc(temp)) %>%
        select(station,date,temp)




