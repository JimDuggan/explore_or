library(ggplot2)
library(dplyr)

mpg

View(mpg)

summary(mpg)

# The first six observations
head(mpg)

# The final six observations
tail(mpg)

sample_n(mpg,10)

sample_frac(mpg, 0.05)

# Replicate using set.seed(n)

set.seed(100)
sample_n(mpg,5)

# Scatter plots

ggplot(data=mpg,aes(x=displ,y=cty))+
  geom_point()

# Add an aesthetic mapping
ggplot(data=mpg,aes(x=displ,y=cty,colour=class))+
  geom_point()

# Use the size argument
ggplot(data=mpg,aes(x=displ,y=cty,colour=class,size=cyl))+
  geom_point()

# Subplots with facets

ggplot(data=mpg,aes(x=displ,y=cty))+
  geom_point()+
  facet_wrap(~class)

ggplot(data=mpg,aes(x=displ,y=cty))+
  geom_point()+
  facet_grid(class~drv)

# Using the lab function
p1 <- ggplot(data=mpg,aes(x=displ,y=hwy,size=cyl,color=class))+
  geom_point()

p1

p1 <- p1 + 
  labs(
    title = "Exploring automobile relationships",
    subtitle = "Displacement v Highway Miles Per Gallon",
    color = "Class of Car",
    size = "Cylinder Size",
    caption = "Sample chart using the lab() function",
    tag = "Plot #1",
    x = "Displacement (Litres)",
    y = "Highway Miles Per Gallon"
  )

p1


