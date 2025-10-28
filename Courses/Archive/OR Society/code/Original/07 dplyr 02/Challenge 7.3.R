library(dplyr)
library(readxl)
library(ggplot2)
library(tidyr)


d <- read_xlsx("datasets/CSO/PopulationByProvince_1986_2016.xlsx")

d <- mutate(d,Year = as.integer(Year))

d_l <- pivot_longer(d,
                    Leinster:Ulster,
                    names_to = "Province", 
                    values_to = "Population")

d_l %>% group_by(Year) %>% 
  summarise(TotalPopulation=sum(Population))

ggplot(d_l,aes(x=Year,y=Population,fill=Province))+geom_area()
