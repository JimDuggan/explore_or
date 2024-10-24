library(ggplot2)
library(dplyr)
library(aimsir17)

m_h <- observations %>% filter(station=="MACE HEAD")

# get the average wind power generated per hour for each day

# Pre-process the data
s_e <- eirgrid17 %>% 
         group_by(month,day,hour) %>%
         summarise(AvrWinGen=mean(IEWindGeneration))

m_h <- m_h %>% select(month,day,hour,wdsp)

j_data <- left_join(s_e,m_h,by=c("month","day","hour"))

ggplot(j_data,aes(x=wdsp,y=AvrWindGen)) + geom_point()









