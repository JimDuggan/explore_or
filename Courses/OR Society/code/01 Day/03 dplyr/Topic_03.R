library(dplyr)
library(ggplot2)
library(aimsir17)

# The tidyverse pipe

set.seed(100)
top_6 <- rpois(12,50) %>%
          sort(decreasing = TRUE) %>%
          head()

mpg %>% sample_n(10) %>% head()
 
# filter - select rows from a tibble
mpg1 <- filter(mpg,class=="2seater")
mpg1


mpg2 <- filter(mpg,class=="2seater",hwy >= 25)
mpg2


mpg3 <- filter(mpg,
               manufacturer == "lincoln" | 
                 manufacturer == "mercury")
mpg3

mpg4 <- filter(mpg,
               manufacturer %in% c("lincoln","mercury"))
mpg4


# arrange - sort rows (use of package name is optional)

dplyr::arrange(mpg,cty) %>% slice(1:3)

dplyr::arrange(mpg,desc(cty)) %>% slice(1:3)

dplyr::arrange(mpg,class,desc(cty)) %>% slice(1:7)



### Choosing columns with `select()`


dplyr::select(mpg,manufacturer,model,year,displ,cty)

mpg %>% dplyr::select(manufacturer:year,cty)

mpg %>% dplyr::select(!(manufacturer:year))

mpg %>% dplyr::select(c(manufacturer:year,cty))

mpg %>% dplyr::select(starts_with("m"))

mpg %>% dplyr::select(contains("an"))

mpg %>% 
  dplyr::select(manufacturer:year,cty,hwy,everything())



# Adding columns with `mutate()`

set.seed(100)
mpg_m <- mpg %>%
  dplyr::filter(class %in% c("compact","midsize")) %>%
  dplyr::select(manufacturer:year,cty,class) %>%
  dplyr::sample_n(6)
mpg_m



# A vector of size 1 is added, and this is recycled to the correct length. 

mpg_m %>% dplyr::mutate(Test="A test")


# A vector of the same length is added, and this vector is based on an existing column.


mpg_m %>% dplyr::mutate(cty_kmh=cty*1.6,
                        cty_2=cty_kmh/1.6)



# Summarizing observations with summarize()

mpg %>% 
  dplyr::summarize(CtyAvr=mean(cty),
                   CtySD=sd(cty),
                   HwyAvr=mean(hwy),
                   HwySD=sd(hwy))

# use group_by to group by a variable, or set of variables.

mpg %>% 
  dplyr::group_by(class) %>%
  dplyr::summarize(CtyAvr=mean(cty),
                   CtySD=sd(cty),
                   HwyAvr=mean(hwy),
                   HwySD=sd(hwy),
                   N=dplyr::n()) %>%
  ungroup()


# Minicase - total rainfall in 2017

observations

annual_rain <- observations %>% 
                  group_by(station) %>% 
                  summarize(TotalRain=sum(rain,na.rm=T)) 
annual_rain

# Check result for Athenry
test <- observations %>%
          filter(station=="ATHENRY") %>%
          pull(rain) %>% 
          sum()

test

ggplot(annual_rain,aes(x=station,y=TotalRain))+
  geom_bar(stat = "identity")+ 
  theme(axis.text.x=element_text(angle=45,hjust=1))+
  geom_hline(yintercept = max(annual_rain$TotalRain),color="red")+
  xlab("Weather Station") + ylab("Total Annual Rainfall")

filter(annual_rain, station %in% c("DUBLIN AIRPORT",
                                          "NEWPORT"))

monthly_rain <- observations %>% 
                    filter(station %in% c("DUBLIN AIRPORT","NEWPORT")) %>%
                    group_by(station, month) %>% 
                    summarize(TotalRain=sum(rain,na.rm = T))

monthly_rain

arrange(monthly_rain,month)

ggplot(monthly_rain,aes(x=month,y=TotalRain,color=station))+ 
        geom_point()+
        geom_line()+ 
        theme(legend.position = "bottom")+ 
        scale_x_continuous(limits=c(1,12), breaks=seq(1,12))+
        labs(x="Month",
             y="Total Rain",
             title = "Monthly rainfall summaries calculated using dplyr")






