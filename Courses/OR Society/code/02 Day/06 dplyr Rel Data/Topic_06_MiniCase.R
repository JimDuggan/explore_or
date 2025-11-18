library(dplyr)
library(aimsir17)
library(ggplot2)


# Summarise the energy output by hour (mean of quarterly observations)
eirgrid17_h <- eirgrid17 %>% 
                 group_by(year,month,day,hour) %>% 
                 summarize(IEWindGenerationH= mean(IEWindGeneration, na.rm=T),
                           TimeS=first(date)) %>% 
                 ungroup() 

slice(eirgrid17_h,1:4)

ggplot(filter(eirgrid17_h,
                     month==1,
                     day == 1), aes(x=hour,y=IEWindGenerationH))+ 
       geom_point()+ geom_line()

observations %>% 
  filter(is.na(wdsp)) %>% 
  group_by(station) %>% 
  count()

obs1 <- observations %>% 
          filter(!is.na(wdsp))

weather_energy <- left_join(eirgrid17_h, 
                            obs1,
                            by=c("year","month", "day","hour")) %>%
                   select(year,
                          month,
                          day,
                          hour, 
                          IEWindGenerationH, 
                          station, 
                          wdsp,
                          rain)

set.seed(100) 
obs_sample <- weather_energy %>%
                filter(station %in% c("MACE HEAD")) %>% 
                sample_n(1000)
obs_sample

ggplot(obs_sample,aes(x=wdsp,y=IEWindGenerationH))+ 
  geom_point()+ 
  geom_jitter()+
  geom_smooth(method="lm")

ggplot(obs_sample,aes(x=rain,y=IEWindGenerationH))+ 
  geom_point()+ 
  geom_jitter()+
  geom_smooth(method="lm")

corr_sum <- weather_energy %>%
              group_by(station) %>% 
              summarize(Correlation=cor(wdsp,IEWindGenerationH)) %>%
              arrange(desc(Correlation))

corr_sum

ggplot(corr_sum,aes(x=Correlation,y=station))+
  geom_bar(stat="identity")
