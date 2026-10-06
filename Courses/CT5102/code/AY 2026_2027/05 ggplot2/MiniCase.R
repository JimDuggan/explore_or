library(aimsir17)
library(ggplot2)

observations

storm <- observations |>
  subset(month==10 & 
           day %in% 15:17 &
           station %in% c("BELMULLET",
                          "ROCHES POINT",
                          "DUBLIN AIRPORT"),
         select=c(station,date,temp,msl,wdsp))
storm

ggplot(data=storm,aes(x=date,y=msl,color=station))+
  geom_point()+
  geom_line() +
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 90))+
  scale_x_datetime(date_breaks = "8 hour",date_labels = "%H:%M %a")+
  labs(title="Storm Ophelia",
       subtitle = "Mean Sea Level Pressure",
       x="Day and Time",
       y="Mean Sea Level Pressure (hPa)",
       color="Weather Station")

ggplot(data=storm,aes(x=date,y=wdsp,color=station))+
  geom_point()+
  geom_line()+
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 90))+
  scale_x_datetime(date_breaks = "8 hour",date_labels = "%H:%M %a")+
  labs(title="Storm Ophelia",
       subtitle = "Wind Speed",
       x="Day and Time",
       y="Wind Speed (Knots)",
       color="Weather Station")

ggplot(data=storm,aes(x=msl,y=wdsp,color=station))+
  geom_point()+
  geom_smooth(method="lm")+
  theme(legend.position = "top")+
  labs(title="Storm Ophelia",
       subtitle="Atmospheric Pressure v Wind Speed with geom_smooth()",
       x="Mean Sea Level Pressure (hPa)",
       y="Wind Speed (Knots)",
       color="Weather Station")
