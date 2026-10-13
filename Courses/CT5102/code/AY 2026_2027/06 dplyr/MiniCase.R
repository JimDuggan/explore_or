library(dplyr)
library(ggplot2)
library(aimsir17)



observations


annual_rain <- observations %>%
  dplyr::group_by(station) %>%
  dplyr::summarize(TotalRain=sum(rain,na.rm=T))
annual_rain



test <- observations %>%
  dplyr::filter(station=="ATHENRY") %>%
  dplyr::pull(rain) %>%
  sum()
test
annual_rain$TotalRain[1]


ggplot(annual_rain,aes(x=station,y=TotalRain))+
  geom_bar(stat = "identity")+
  theme(axis.text.x=element_text(angle=45,hjust=1))+
  geom_hline(yintercept = max(annual_rain$TotalRain),color="red")+
  xlab("Weather Station") + ylab("Total Annual Rainfall")



dplyr::filter(annual_rain,
       station %in% c("DUBLIN AIRPORT", 
                      "NEWPORT"))


monthly_rain <- observations %>%
                dplyr::filter(station %in% c("DUBLIN AIRPORT", 
                                             "NEWPORT")) %>%
                dplyr::group_by(station, month) %>%
                dplyr::summarize(TotalRain=sum(rain,na.rm = T))
monthly_rain



dplyr::arrange(monthly_rain,month)

ggplot(monthly_rain,aes(x=month,y=TotalRain,color=station))+
  geom_point()+geom_line()+
  theme(legend.position = "bottom")+
  scale_x_continuous(limits=c(1,12), breaks=seq(1,12))+
  labs(x="Month",
       y="Total Rain",
       title = "Monthly rainfall summaries calculated using dplyr")
