# For all stations, create a tibble with
# the min, max, median, and mean temperature

p1 <- observations %>%
        group_by(station) %>%
        summarise(MinT=min(temp),
                  MaxT=max(temp),
                  MedT=median(temp),
                  MeanT=mean(temp),
                  N=n())


# Repeat this for each month of the year
p2 <- observations %>%
  group_by(month,station) %>%
  summarise(MinT=min(temp),
            MaxT=max(temp),
            MedT=median(temp),
            MeanT=mean(temp),
            ColdestDay=nth(day,which.min(temp)),
            WarmestDay=nth(day,which.max(temp)),
            N=n())

# Repeat this for every season

ob1 <- observations %>%
         mutate(Season=ifelse(month %in% 2:4,"Spring",
                              ifelse(month %in% 5:7,"Summer",
                                     ifelse(month %in% 8:10,"Autumn","Winter"))))

p3 <- ob1 %>%
        group_by(Season) %>%
        summarise(MinT=min(temp),
                  MaxT=max(temp),
                  MedT=median(temp),
                  MeanT=mean(temp),
                  ColdestMonth=nth(month,which.min(temp)),
                  WarmestMonth=nth(month,which.max(temp)),
                  N=n())
