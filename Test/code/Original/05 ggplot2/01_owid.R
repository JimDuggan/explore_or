library(readxl)
library(lubridate)
library(ggplot2)

d <- read_xlsx("datasets/OurWorldInData/201024 owid-covid-data.xlsx")
d$date <- ymd(d$date)

countries <- c("Ireland","United Kingdom","Germany")

df1 <- subset(d,location %in% countries)
df1$cases_per_100K <- 100000*df1$new_cases/df1$population

ggplot(data=df1,aes(x=date,y=cases_per_100K,colour=location))+geom_line()+geom_point()
