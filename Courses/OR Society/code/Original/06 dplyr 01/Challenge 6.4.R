# Organise the following into a pipeline command
# Subset all observations from aimsir17 from October 2017
# Select all those from “ROCHES POINT”
# Sort the observations by wind speed (descending)
# Select the top five (see the dplyr function slice)
# Store in a result tibble
library(aimsir17)
library(dplyr)

ans <- observations                     %>%
       filter(station=="ROCHES POINT")  %>%
       filter(month==10)                %>%
       arrange(desc(wdsp))              %>%
       slice(1:5)

t1 <- filter(observations,station=="ROCHES POINT")
t2 <- filter(t1,month==10)
t3 <- arrange(t2, desc(wdsp))
ans1 <-slice(t3,1:5) 



