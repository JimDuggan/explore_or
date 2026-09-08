library(ggplot2)

p1 <- ggplot(data=mpg,
             aes(x=displ,
                 y=cty,
                 colour=class,
                     size=cyl))+
        geom_point()

p1 + facet_wrap(~manufacturer)

