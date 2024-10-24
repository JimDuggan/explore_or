# Generate a similar tibble for the manufacturers in mpg.
# For this example, use hwy as the dependent variable, 
# and cyl as the independent variable
# Check the results using ggplot() and geom_smooth()


library(purrr)
library(ggplot2)
library(dplyr)



mpg %>% group_split(manufacturer) %>%
      map_df(~{
        mod <- lm (.$cty~.$displ)
        summ <- summary(mod)
        tibble(Class=first(.$manufacturer),
               Obs=nrow(.),
               Intercept=mod$coefficients[1],
               Slope=mod$coefficients[2],
               RSquared=summ$r.squared,
               AdjRSquared=summ$adj.r.squared)
      }) %>%
      arrange(desc(RSquared))

ggplot(mpg,aes(x=displ,y=cty))+
  geom_point()+geom_smooth(method="lm")+facet_wrap(~manufacturer)+
  xlim(c(0,7))

