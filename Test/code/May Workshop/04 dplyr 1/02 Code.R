# pipe operator

res1 <- arrange(mpg,cty)

res2 <- mpg %>% arrange(cty)

ob1 <- filter(observations,station=="ROCHES POINT",day==16,month==10)
ob2 <- arrange(ob1,desc(wdsp))

ob3 <- observations %>%
         filter(station=="ROCHES POINT",day==16,month==10) %>%
         arrange(desc(wdsp))


mpg1 <- mpg %>%
         mutate(MPGDiff1=hwy-cty,
                MPGDiff2=cty-hwy,
                cty_kph=cty*1.6,
                hwy_kph=hwy*1.6) %>%
         arrange(desc(MPGDiff1))

