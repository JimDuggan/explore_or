library(dplyr)

tab_x <- tibble(key=c(1,2,3),
                val_x=c("x1","x2","x3"))

tab_y <- tibble(key=c(1,2,4),
                val_y=c("y1","y2","y3"))

full_join(tab_x,tab_y)


