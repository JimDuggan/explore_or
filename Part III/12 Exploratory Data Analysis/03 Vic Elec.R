library(ggplot2)
library(dplyr)
library(tsibble)
library(tsibbledata)
library(lubridate)
library(tidyr)
library(ggpubr)

# Data preparation
aus_elec <- vic_elec %>%
             tsibble::as_tibble() %>%
             mutate(WDay=wday(Time,label=TRUE),
                    Year=year(Time),
                    Month=as.integer(month(Time)),
                    Hour=hour(Time),
                    YearDay=yday(Time),
                    Quarter=case_when(
                      Month %in% 1:3 ~ "Q1",
                      Month %in% 4:6 ~ "Q2",
                      Month %in% 7:9 ~ "Q3",
                      Month %in% 10:12 ~ "Q4",
                      .default = "Undefined"
                    ),
                    DaySegment=case_when(
                      Hour %in%  0:5 ~ "S1",
                      Hour %in% 6:11 ~ "S2",
                      Hour %in% 12:17 ~ "S3",
                      Hour %in% 18:23 ~ "S4",
                      .default = "Undefined"
                    ))

aus_long <- aus_elec %>%
             select(Time,Demand,Temperature,Quarter) %>%
             pivot_longer(names_to="Indicator",
                          values_to="Value",
                          -c(Time,Quarter))

ggplot(aus_long,aes(x=Time,y=Value,colour=Quarter))+
  geom_point(size=0.2)+
  facet_wrap(~Indicator,scales="free",ncol = 1)


aus_cor <- aus_elec %>%
            group_by(Year, Quarter) %>%
            summarise(CorrCoeff=cor(Temperature, Demand)) %>%
            arrange(desc(CorrCoeff))

ggplot(aus_elec,aes(x=Temperature,y=Demand))+
  geom_point(alpha=0.2,size=0.3)+
  facet_grid(Year~Quarter)+
  stat_cor()



# Average daily demand by season, month, day?

aus_summ <- aus_elec %>%
             group_by(Year,Quarter) %>%
             summarise(MaxD=max(Demand),
                       MaxIndex=which.max(Demand),
                       Time=Time[MaxIndex],
                       Temp=Temperature[MaxIndex],
                       Day=WDay[MaxIndex],
                       DaySegment=DaySegment[MaxIndex]) %>%
             arrange(desc(MaxD))

aus_elec %>% filter(Quarter=="Q1",Year==2014) %>% slice(755)


# geom_ribbon here...
daily_summ <- aus_elec %>%
              group_by(Date) %>%
              summarise(Year=first(Year),
                        Quarter=first(Quarter),
                        MeanD=mean(Demand),
                        MaxD=max(Demand),
                        MinD=min(Demand)
                       ) %>%
              ungroup()

slice(daily_summ,1)

daily_summ <- daily_summ %>%
              group_by(Year,Quarter) %>%
              mutate(QDay=1:n()) %>%
              select(Date:Quarter,QDay,everything()) %>%
              ungroup()
slice(daily_summ,1)

daily_summ <- daily_summ %>%
              filter(Year %in% c(2012,2014)) %>%
              pivot_longer(names_to = "Variable",
                           values_to = "Value",
                           -c(Date:QDay))
slice(daily_summ,3)
      


ggplot(daily_summ,aes(x=QDay,y=Value,colour=as.factor(Year)))+
  geom_line()+
  facet_grid(Variable~Quarter)+
  labs(y="Daily Electricity Demand (MWh)",
       x="Day of Quarter (1 is first day)",
       )


  