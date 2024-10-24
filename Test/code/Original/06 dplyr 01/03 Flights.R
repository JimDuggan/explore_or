library(nycflights13)
library(dplyr)
library(ggplot2)

by_dest <- group_by(flights,dest)

delay <- summarize(by_dest,
                   count = n(),
                   dist=mean(distance,na.rm=T),
                   delay=mean(arr_delay,na.rm=T)) %>%
         filter(count > 20, dest != "HNL")

ggplot(data=delay,mapping = aes(x=dist,y=delay)) +
  geom_point(aes(size=count),alpha=1/3)+
  geom_smooth(se=F)

sml <- select(flights,
              year:day,
              ends_with("delay"),
              distance,
              air_time)

mutate(sml,gain=dep_delay-arr_delay)

mutate(sml,speed=distance/air_time * 60)

transmute(sml,gain=dep_delay-arr_delay,speed=distance/air_time * 60)

summarise(flights,
          AvrDelay=mean(dep_delay,na.rm=TRUE))

by_month <- group_by(flights,month)

ans <- summarise(by_month,
                   AvrDelay=mean(dep_delay,na.rm=T))

ggplot(ans,mapping=aes(x=month,y=AvrDelay))+
  geom_point()+geom_path()

by_month <- group_by(flights,month,origin)

ans <- summarise(by_month,AvrDelay=mean(dep_delay,na.rm=T))

ggplot(ans,mapping=aes(x=month,y=AvrDelay,colour=origin))+
        geom_point()+geom_path()

delay <- flights %>% group_by(dest) %>% 
           summarize(count=n(),
                     AvrDist=mean(distance,na.rm=T),
                     AvrDelay=mean(arr_delay,na.rm=T)) %>%
           arrange(dest) %>% filter(count>20,dest!="HNL")

ggplot(data=delay,mapping = aes(x=AvrDist,y=AvrDelay)) +
  geom_point(aes(size=count),alpha=1/3)+
  geom_smooth(se=F)



