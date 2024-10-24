library(readxl)
library(tidyr)
library(ggplot2)

pop <- read_excel("datasets/CSO/TimeSeries_Census.xlsx")

tidy_pop <- gather(pop,
                   key = "Province", 
                   value="Population",
                   Leinster:Ulster)

ggplot(data=tidy_pop, 
       aes(x=Year,y=Population,fill=Province))+
  geom_area()
