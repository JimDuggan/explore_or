library(dplyr)
library(readxl)
library(tidyr)

d <- readxl::read_xlsx("code/AY 20_21/07 dplyr 02/ExamDataBroad.xlsx")

apply(d[,-1],1,mean)

td <- pivot_longer(d,
                   CX1000:CX1009,
                   names_to="SubjectCode",
                   values_to="Result")

ggplot(td,aes(x=SubjectCode,y=Result))+geom_boxplot()

# Display the order of mean grades by subject

td %>% group_by(SubjectCode) %>%
       summarise(MeanGrade=mean(Result),
                 MinGrade=min(Result),
                 MedGrade=median(Result),
                 NObs=n()) %>%
       arrange(desc(MeanGrade))

