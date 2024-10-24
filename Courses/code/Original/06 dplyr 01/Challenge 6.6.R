library(aimsir17)
library(dplyr)

m_r <- observations %>%
       filter(station %in% c("BELMULLET","DUBLIN AIRPORT","MACE HEAD")) %>%
       group_by(month,station) %>%
       summarise(TotalRainfall=sum(rain,na.rm=T),
                 MaxRainfall=max(rain,na.rm=T))

ggplot(m_r,aes(x=month,y=TotalRainfall,colour=station))+
  geom_line()+geom_point()

min_t <- observations %>%
  filter(station %in% c("BELMULLET","DUBLIN AIRPORT","MACE HEAD")) %>%
  group_by(month,station) %>%
  summarise(MinTemp=min(temp,na.rm=T))

ggplot(min_t,aes(x=month,y=MinTemp,colour=station))+
  geom_line()+geom_point()

max_w <- observations %>%
  filter(station %in% c("BELMULLET","DUBLIN AIRPORT","MACE HEAD",
                        "ROCHES POINT")) %>%
  group_by(month,station) %>%
  summarise(MaxWDSP=max(wdsp,na.rm=T))

ggplot(max_w,aes(x=month,y=MaxWDSP,colour=station))+
  geom_line()+geom_point()
