library(ggplot2)
library(dplyr)
library(titanic)

titanic <- titanic_train %>%
            mutate(Survived=as.logical(Survived),
                   Class=factor(Pclass,
                                levels=c(1,2,3)))

# Explore survival

titanic %>%
  summarise(N=n(),
            TSurvived=sum(Survived),
            TPerished=sum(Survived==FALSE),
            PropSurvived=TSurvived/N,
            PropPerised=TPerished/N)


# Explore survival by sex

titanic %>%
  group_by(Sex) %>%
  summarise(N=n(),
            TSurvived=sum(Survived),
            TPerished=sum(Survived==FALSE),
            PropSurvived=TSurvived/N,
            PropPerised=TPerished/N) %>%
            arrange(desc(PropSurvived))


titanic %>%
  group_by(Class) %>%
  summarise(N=n(),
            TSurvived=sum(Survived),
            TPerished=sum(Survived==FALSE),
            PropSurvived=TSurvived/N,
            PropPerised=TPerished/N) %>%
  arrange(desc(PropSurvived))

titanic %>%
  group_by(Class,Sex) %>%
  summarise(N=n(),
            TSurvived=sum(Survived),
            TPerished=sum(Survived==FALSE),
            PropSurvived=TSurvived/N,
            PropPerised=TPerished/N) %>%
  arrange(desc(PropSurvived))


ggplot(titanic,aes(x=Survived,fill=Survived))+
     geom_bar(colour="white",alpha=0.75)+
     facet_grid(Sex~Pclass,scales="free")+
     theme(legend.position = "none")+
     labs(title="Survival outcomes on the Titanic",
          x="Survival Outcome",
          y="Number of Passengers")+
     scale_fill_manual(values=c("red","green"))

# summary table



