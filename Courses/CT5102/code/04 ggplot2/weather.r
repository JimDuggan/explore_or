library(aimsir17)
library(ggplot2)

oph <- observations |>
        subset(station %in% c("BELMULLET",
                              "ROCHES POINT",
                              "DUBLIN AIRPORT")) |>
        subset(month==10) |>
        subset(day %in% 15:17)

ggplot(data=oph,aes(x=date,
                    y=msl,
                    colour = station))+
  geom_point()+geom_line()
