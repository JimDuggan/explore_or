library(readr)
library(ggplot2)

ex <- read_csv("code/AY 20_21/06 dplyr 01/ExamDataBroad.csv")

tidy <- pivot_longer(ex,
                     -StudentID,
                     names_to="Subject",
                     values_to="Grade")

ggplot(tidy,aes(x=Subject,y=Grade))+geom_boxplot()


ggplot(tidy,aes(x=as.factor(StudentID),y=Grade))+geom_boxplot()


wide <- tidy %>% 
          pivot_wider(names_from = Subject, 
                      values_from = Grade)


