library(tidyr)
library(ggplot2)

r_l <- pivot_longer(relig_income,
                    !religion, 
                    names_to = "Income", 
                    values_to = "Numbers")

ggplot(r_l,aes(x=Income,y=Numbers,fill=religion))+geom_bar(stat="identity")


