library(tidyr)
library(readxl)

ud <- read_excel("datasets/Synthetic Data/ExamDataBroad.xlsx")

td <- gather(ud,key=Subject,value=Result,CX1000:CX1009)

td %>% group_by(StudentID) %>% 
       summarise(Mean=mean(Result)) %>% 
       arrange(desc(Mean))