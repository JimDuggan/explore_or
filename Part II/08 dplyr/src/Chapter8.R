# Chapter 8: Data Transformation with dplyr

library(dplyr)
library(ggplot2)

# filter - select rows from a tibble
mpg1 <- filter(mpg,class=="2seater")
mpg1


mpg2 <- filter(mpg,class=="2seater",hwy >= 25)
mpg2


mpg3 <- filter(mpg,
               manufacturer == "lincoln" | 
               manufacturer == "mercury")
mpg3

mpg4 <- filter(mpg,
               manufacturer %in% c("lincoln","mercury"))
mpg4


# arrange - sort rows (use of package name is optional)

dplyr::arrange(mpg,cty) %>% slice(1:3)

dplyr::arrange(mpg,desc(cty)) %>% slice(1:3)

dplyr::arrange(mpg,class,desc(cty)) %>% slice(1:7)

