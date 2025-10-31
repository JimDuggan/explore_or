library(nycflights13)
library(dplyr)
library(lubridate)

flights %>%
  pull(origin) %>%
  unique()

# What NYC airport has the longest mean delay times?

flights %>%
  group_by(origin) %>%
  summarise(MeanDD=mean(dep_delay,na.rm=TRUE)) %>%
  arrange(MeanDD)


# What month of the year has the longest mean delay times?
flights %>%
  pull(month) %>%
  unique()

flights %>%
  group_by(month) %>%  
  summarise(MeanDD=mean(dep_delay,na.rm=TRUE),
            NFlights=n()) %>%
  arrange(desc(MeanDD))

flights %>%
  group_by(month,origin) %>%  
  summarise(MeanDD=mean(dep_delay,na.rm=TRUE),
            NFlights=n()) %>%
  arrange(desc(MeanDD))

# What day of the week has the longest mean delay times?
flights1 <- flights %>%
              mutate(WeekDay=wday(time_hour,label=TRUE),)

flights1 %>%
  group_by(WeekDay) %>%  
  summarise(MeanDD=mean(dep_delay,na.rm=TRUE),
            NFlights=n()) %>%
  arrange(desc(MeanDD))

flights1 %>%
  group_by(origin,WeekDay) %>%  
  summarise(MeanDD=mean(dep_delay,na.rm=TRUE),
            NFlights=n()) %>%
  arrange(desc(MeanDD))

# What time of the day has the longest mean delay times?
flights %>%
  group_by(hour) %>%  
  summarise(MeanDD=mean(dep_delay,na.rm=TRUE),
            NFlights=n()) %>%
  arrange(desc(MeanDD))
