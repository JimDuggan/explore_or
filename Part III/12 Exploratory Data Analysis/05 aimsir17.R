library(dplyr)
library(ggplot2)
library(aimsir17)

st4 <- c("MALIN HEAD",
         "DUBLIN AIRPORT",
         "ROCHES POINT",
         "MACE HEAD")

# Filter data, convert to factor, and update average hourly windspeed
# from knots to kmh
eda0 <- observations %>%
  filter(station %in% st4) %>%
  mutate(station=factor(station),
         wdsp=wdsp*1.852) %>%
  dplyr::select(-year)


# Add two new features (variable), wind direction (simplified) and 
# wind warning information
eda <- eda0 %>%
  mutate(wind_dir = case_when(
    wddir > 315    | wddir <= 45  ~ "N",
    wddir > 45     & wddir <= 135  ~ "E",
    wddir > 135     & wddir <= 225 ~ "S",
    wddir > 225    & wddir <= 315 ~ "W",
    .default = "Missing"),
    wind_dir = ifelse(wind_dir=="Missing",
                      NA, wind_dir),
    wind_dir= factor(wind_dir,
                    levels=c("N","E","S","W")))


winter <- eda %>%
           filter(month %in% c(11,12,1))


w_sum <- winter %>%
          group_by(wind_dir,station) %>%
          summarise(Temp25Q=quantile(temp,0.25),
                    Temp75Q=quantile(temp,0.75),
                    TempMed=median(temp)) %>%
          arrange(station,wind_dir)

ggplot(winter,aes(x=wind_dir,y=temp,colour=station))+
  geom_boxplot()+
  facet_wrap(~station)+
  theme(legend.position = "none")


