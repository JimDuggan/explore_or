ggplot(observations,aes(y=temp,x=as.factor(month)))+geom_boxplot()

ggplot(observations,aes(y=temp,x=as.factor(month)))+geom_boxplot()+facet_wrap(~station)

