library(purrr)
library(ggplot2)
library(tidyr)
library(ggpubr)

# Evaluate a linear model for each class
n_mpg <- mpg %>%
          group_by(class) %>%
          nest()          %>%
          mutate(LM=map(data,~{lm(cty~displ,data=.)}))

# Taking in 2 vectors with map2: the data and the model
plots <- map2(n_mpg$data,n_mpg$LM,~{
  ggplot(.x,aes(x=displ,y=cty))+geom_point()+
    geom_abline(intercept=coef(.y)[1],
                slope=coef(.y)[2],
                colour="red",
                size=2)+
    geom_smooth(method="lm")+
    geom_jitter()
})

ggarrange(plotlist=plots)



