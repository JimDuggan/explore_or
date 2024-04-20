# https://www.statology.org/iris-dataset-r/

# https://www.sciencefacts.net/sepals.html


library(ggplot2)
library(dplyr)
library(tidyr)

iris_tb <- as_tibble(iris)

iris_long <- pivot_longer(iris_tb,
                          names_to = "Measurement", 
                          values_to = "Value",
                          -Species)

ggplot(iris_long,aes(x=Value,fill=Species))+
  geom_histogram(color="white", alpha=0.7)+
  facet_wrap(~Measurement,ncol=1)

ggplot(iris_tb,aes(x=Sepal.Length,fill=Species))+
     geom_histogram(color='#e9ecef', alpha=0.6)

ggplot(iris_tb,aes(x=Sepal.Width,fill=Species))+
  geom_histogram(color='#e9ecef', alpha=0.6)

ggplot(iris_tb,aes(x=Petal.Width,fill=Species))+
  geom_histogram(color='#e9ecef', alpha=0.6)

ggplot(iris_tb,aes(x=Petal.Length,fill=Species))+
  geom_histogram(color='#e9ecef', alpha=0.6)

ggplot(iris_tb,aes(x=Sepal.Length,y=Sepal.Width,colour=Species))+geom_point()

ggplot(iris_tb,aes(x=Petal.Length,y=Petal.Width,colour=Species))+geom_point()

ggplot(iris_tb,aes(x=Species,y=Petal.Length))+geom_boxplot()


iris_long <- pivot_longer(iris_tb,names_to = "Measurement", values_to = "Value",-Species)

ggplot(iris_long,aes(y=Value,colour=Species))+geom_boxplot()+facet_wrap(~Measurement)


ggplot(iris_tb,aes(x=Petal.Length,y=Petal.Width,colour=Species)) + geom_point()

res <- iris_long %>%
        group_by(Species,Measurement) %>%
        summarise(Min=min(Value),
                  Max=max(Value),
                  Mean=mean(Value),
                  SD=sd(Value)) %>%
        ungroup() %>%
        arrange(desc(Mean)) %>%
        slice(1:12)
        


