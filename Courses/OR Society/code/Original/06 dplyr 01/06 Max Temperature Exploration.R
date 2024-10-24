library(aimsir17)
library(ggplot2)

mh <- observations %>% 
       filter(station=="MACE HEAD") %>% 
       group_by(month,day) %>% 
       summarise(Max=max(temp),PeakHour=hour[which.max(temp)]) %>%
       ungroup() 

s_mh <- mh %>% group_by(month) %>%
          summarise(AvrPeak=mean(PeakHour),
                    MedianPeak=median(PeakHour),
                    SD=sd(PeakHour))

ggplot(mh,aes(x=month,y=PeakHour,group=month,colour=as.factor(month)))+geom_boxplot()
ggplot(mh,aes(x=PeakHour,fill=as.factor(month)))+geom_histogram(binwidth = 1)+facet_wrap(~month)




