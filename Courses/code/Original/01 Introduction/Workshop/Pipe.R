library(ggplot2)

library(dplyr)

library(aimsir17)

target <- c("BELMULLET","DUBLIN AIRPORT")
target <- c("BELMULLET")

b <- filter(observations,station %in% target)

b <- filter(observations,station %in% target,month==1,day==1)

b <- filter(observations,station == "BELMULLET" | station =="DUBLIN AIRPORT")

# filter valentia island and roches point on 16th october and show MSL

t <-  c("VALENTIA OBSERVATORY","ROCHES POINT")

oct_16 <- filter(observations, station %in% t,month==10, day==16)

sorted_oct_16_1 <- observations %>% 
                     filter(day==16,month==10) %>% 
                     arrange(desc(wdsp))

oct_16 <- filter(observations,day==16,month==10)
sorted_oct_16_2 <- arrange(oct_16,desc(wdsp))





