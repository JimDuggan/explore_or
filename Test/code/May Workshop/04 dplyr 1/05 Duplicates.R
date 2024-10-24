library(dplyr)

# https://www.datasciencemadesimple.com/remove-duplicate-rows-r-using-dplyr-distinct-function/

mydata <- tibble(NAME=c('Alisa','Bobby','jodha','jack','raghu','Cathrine',
                         'Alisa','Bobby','kumar','Alisa','jack','Cathrine'),
                     Age = c (26,24,26,22,23,24,26,24,22,26,22,25),
                     Score =c(85,63,55,74,31,77,85,63,42,85,74,78))

mydata

myd1 <- distinct(mydata)
myd2 <- distinct(mydata,NAME,.keep_all = TRUE)
myd3 <- distinct(mydata,NAME,Age,.keep_all = TRUE)

