# Install the package aimsir17
# Subset all the observations for January (MACE HEAD)
# Add a new column “WeatherWarning” that is true if the 
# temperature is less than or equal to 4C
# Count the percentage of observations that had a weather warning for January.

library(aimsir17)
library(ggplot2)

mh <- subset(observations, station=="MACE HEAD" & month==1)

qplot(mh$date,mh$temp)+geom_line()

mh$WW <- ifelse(mh$temp <= 4, TRUE, FALSE)

qplot(mh$date,mh$temp,colour=mh$WW)
