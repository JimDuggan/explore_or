library(dplyr)
library(purrr)
library(tidyr)
library(ggplot2)
library(aimsir17)

# =============================================================================
# Showing group_split()
# =============================================================================
set.seed(100) 
test <- mpg %>% 
         select(manufacturer:displ,cty,class) %>%
         filter(class %in% c("compact","midsize")) %>%
         sample_n(5)

test

test_s <- test %>% 
            group_by(class) %>% 
            group_split() 
test_s


# Processing the list with purrr
test_s %>% 
  map_int(~nrow(.x))

# We simplify the dataset to daily values, where we take (1) the maximum wind speed (wdsp) recorded 
# and (2) the average mean sea level pressure (msl).

d_data <- observations %>% 
            filter(complete.cases(observations)) %>% 
            group_by(station,month,day) %>% 
            summarize(MaxWdsp=max(wdsp,na.rm=TRUE), 
                      DailyAverageMSL=mean(msl,na.rm=TRUE)) %>% 
            ungroup()

d_data


cor7 <- d_data %>%
          group_by(station) %>% 
          group_split() %>% 
          map_df(~{ corr <- cor(.x$MaxWdsp,.x$DailyAverageMSL) 
                    tibble(Station=first(.x$station), 
                           CorrCoeff=corr) }) %>% 
          arrange(CorrCoeff) %>% 
          slice(1:7)

# Same answer not using purrr
cor7_b <- d_data %>% 
            group_by(station) %>% 
            summarize(CorrCoeff=cor(MaxWdsp,DailyAverageMSL)) %>% 
            arrange(CorrCoeff) %>% 
            slice(1:7) 

cor7_b

# =============================================================================
# Showing nest()
# =============================================================================

data_n <- d_data %>%
            group_by(station) %>% 
            nest()

data_n %>% head() 

data_n %>% 
  pull(data) %>% 
  first()

# Linear regression model as new column
data_n <- data_n %>% 
            mutate(LM=map(data, ~lm(MaxWdsp~DailyAverageMSL, data=.)))

data_n %>% head()

# Explore Belmullet Model
data_n %>%
  filter(station=="BELMULLET") %>%
  pull(LM) %>% 
  first() %>% 
  summary()

# Add R Squared summary statistic
data_n <- data_n %>% 
            mutate(RSq=map_dbl(LM,~summary(.x)$r.squared)) %>% 
            arrange(desc(RSq)) 

data_n <- data_n %>% head(n=3) 

data_n

# =============================================================================
# Additional purrr functions
# =============================================================================

library(ggplot2) 
library(repurrrsive)

# Use pluck() to access the second element of an atomic vector 
mpg %>% 
  pull(class) %>% 
  unique() %>% 
  pluck(2) 

# Use pluck() to access the director in the first list location 
sw_films %>% 
  pluck(1,"director")


# Using walk()
l <- list(el1=20,el2=30,el3=40) 
o <- walk(l,~cat("Creating a side effect...\n")) 
str(o) 

# Using keep()
o <- sw_films %>% 
       keep(~.x$director=="George Lucas") 

walk(o,~cat(.x$director," ==> Title =",.x$title,"\n"))

