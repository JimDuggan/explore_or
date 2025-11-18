library(ggplot2)
library(dplyr)

# Explore two available tibbles
glimpse(mpg)
glimpse(diamonds)

# bar charts
ggplot(data=diamonds,mapping=aes(x=cut))+ 
  geom_bar()

ggplot(data=diamonds,mapping=aes(x=color))+ 
  geom_bar()

ggplot(data=diamonds,mapping=aes(x=cut,fill=color))+ 
  geom_bar()

ggplot(data=diamonds,mapping=aes(x=cut,fill=color))+ 
  geom_bar(position="dodge")

ggplot(data=diamonds,mapping=aes(x=color,fill=cut))+ 
  geom_bar(position="dodge")

# Visualising distributions

ggplot(data=diamonds,mapping=aes(x=price))+ 
  geom_histogram(bins=15)

ggplot(data=diamonds,mapping=aes(y=price))+ 
  geom_boxplot()

ggplot(data=diamonds,mapping=aes(y=price,color=cut))+ 
  geom_boxplot()

ggplot(data=mpg,aes(x=class,y=cty))+
  geom_boxplot()

# Co-variation with ggpairs (GGally)
library(GGally)

my_vars <- select(mpg,c(cty,hwy,displ)) 
ggpairs(my_vars)

# Themes

p1 <- ggplot(mpg,aes(x=displ,y=cty,colour=class)) + geom_point()

p1+ theme(legend.title=element_text(face="bold"), 
          legend.position = "top", 
          axis.text.x = element_text(size=15,face="italic"),
          panel.background = element_rect(fill="white"),
          panel.grid= element_line(color = "blue",
                                   linewidth = 0.3, 
                                   linetype = 3))

p1 + theme_bw() + ggtitle("theme_bw()")
p1 + theme_light() + ggtitle("theme_light()")
p1 + theme_dark()+ ggtitle("theme_dark()")
p1 + theme_minimal()+ ggtitle("theme_minimal()")
p1 + theme_classic() + ggtitle("theme_classic()")
p1 + theme_void() + ggtitle("theme_void()")

# devtools::install_github('bbc/bbplot')

library(bbplot)
p1 + bbc_style()


# Adding lines to plot
ggplot(data=mpg,mapping=aes(x=displ,y=cty))+ 
  geom_point()+
  geom_vline(xintercept = 4,color="red")+
  geom_hline(yintercept = 22.5,color="blue")+
  geom_abline(slope=10,intercept=-17.5,linetype="dashed")


# Mini-case - Storm Ophelia

library(aimsir17)

# The tibble containing weather observations for 2017
observations

storm <- observations %>% 
           filter(month==10,
                  day %in% 15:17,
                  station %in% c("BELMULLET", 
                                 "ROCHES POINT", 
                                 "DUBLIN AIRPORT")) %>%
         select(c(station,date,temp,msl,wdsp))

storm

ggplot(data=storm,aes(x=date,y=msl,color=station))+
  geom_point()+ 
  geom_line() + 
  theme(legend.position = "top", 
        axis.text.x = element_text(angle = 90))+ 
  scale_x_datetime(date_breaks = "4 hour",
                   date_labels = "%H:%M %a")+
  labs(title="Storm Ophelia",
       subtitle = "Mean Sea Level Pressure",
       x="Day and Time",
       y="Mean Sea Level Pressure (hPa)",
       color="Weather Station")

ggplot(data=storm,aes(x=date,y=wdsp,color=station))+
  geom_point()+ 
  geom_line()+ 
  theme(legend.position = "top", 
        axis.text.x = element_text(angle = 90))+ 
  scale_x_datetime(date_breaks = "8 hour",date_labels = "%H:%M %a")+
  labs(title="Storm Ophelia",
       subtitle = "Wind Speed",
       x="Day and Time",
       y="Wind Speed (Knots)",
       color="Weather Station")


ggplot(data=storm,aes(x=msl,y=wdsp,color=station))+ geom_point()+
  geom_smooth(method="lm")+
  theme(legend.position = "top")+
  labs(title="Storm Ophelia",
       subtitle="Atmospheric Pressure v Wind Speed with geom_smooth()", 
       x="Mean Sea Level Pressure (hPa)", 
       y="Wind Speed (Knots)",
       color="Weather Station")
