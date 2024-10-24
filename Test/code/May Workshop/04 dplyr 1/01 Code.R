# Show the weather for “ROCHES POINT” on October 16th at 12 midday 
library(aimsir17)
library(ggplot2)
library(dplyr)



rp <- filter(observations,
             station == "ROCHES POINT",
             month==10,
             day==16,
             hour==12)

rp1 <- filter(observations,
             station == "ROCHES POINT",
             month==10,
             day==16)

ggplot(rp1,aes(x=date,y=msl))+geom_point()+geom_line()
ggplot(rp1,aes(x=date,y=wdsp))+geom_point()+geom_line()

rp2 <- filter(observations,
              station == "ROCHES POINT")

ggplot(rp2,aes(x=date,y=wdsp))+geom_point()+geom_line()

rp3 <- filter(observations,
              # station %in% c("ROCHES POINT","MACE HEAD"),
              month==10,
              day==16)

ggplot(rp3,aes(x=date,y=msl,colour=station))+geom_point()+geom_line()


arrange(observations,month,desc(temp))

