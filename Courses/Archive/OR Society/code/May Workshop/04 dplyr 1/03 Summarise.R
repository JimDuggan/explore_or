library(dplyr)
library(ggplot2)
library(aimsir17)


omh <- filter(observations,station=="MACE HEAD",month==10)

obl <- filter(observations,station=="BELMULLET",month==10)

rb <- obl %>%
       group_by(day) %>%
       summarise(TotalRain=sum(rain,na.rm=TRUE)) %>%
       arrange(desc(TotalRain))

rb2 <- obl %>%
  group_by(hour) %>%
  summarise(TotalRain=sum(rain,na.rm=TRUE)) %>%
  arrange(desc(TotalRain))



