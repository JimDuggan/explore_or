# Chapter 10 Examples -  Processing Data with purrr
library(purrr)
library(aimsir17)
library(dplyr)
library(repurrrsive)

o1 <- purrr::map(c(1,2,3,2),function(x)x^2)
str(o1)

o2 <- purrr::map(c(1,2,3,2),~.x^2)
str(o2)
o3 <- purrr::map(c(1,2,3,2),~.^2)
str(o3)


mtcars %>%
  dplyr::select(mpg,cyl,disp) %>%
  purrr::map_dbl(mean)

sw_films %>%
  purrr::map_chr(~.x$director) %>%
  unique()


means <- c(10,20,30)
sds   <- c(2,4,7)

purrr::map2(means,sds,~rnorm(5,.x,.y)) %>% str()

d_data <- observations %>%
  dplyr::filter(complete.cases(observations)) %>%
  dplyr::group_by(station,month,day) %>%
  dplyr::summarize(MaxWdsp=max(wdsp,na.rm=TRUE),
                   DailyAverageMSL=mean(msl,na.rm=TRUE)) %>%
  dplyr::ungroup()
d_data


cor7 <- d_data %>%
  dplyr::group_by(station) %>%
  dplyr::group_split() %>%
  purrr::map_df(~{
    corr <- cor(.x$MaxWdsp,.x$DailyAverageMSL)
    tibble(Station=first(.x$station),
           CorrCoeff=corr)
  }) %>%
  dplyr::arrange(CorrCoeff) %>%
  dplyr::slice(1:7)

cor7

