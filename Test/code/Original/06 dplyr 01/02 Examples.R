library(dplyr)



df <- tbl_df(iris)
glimpse(df)

# cheatsheet exercises - extract cases
filter(df,Sepal.Length >7)

distinct(df,Species)

sample_frac(df,0.5)

sample_n(df,3)

slice(df,3:10)

top_n(df,2)

# Summarise cases

summarise(df,avr=mean(Sepal.Width),NDis=n_distinct(Species))

df %>% group_by(Species) %>% summarise(Obs=n(),avr.width=mean(Sepal.Width),med.width=median(Sepal.Width))

df %>% group_by(Species) %>% summarise_all(mean)

df %>% group_by(Species) %>% summarise_all(mean)

df %>% group_by(Species) %>% summarise_at(vars(Sepal.Length:Sepal.Width),mean)

df %>% group_by(Species) %>% summarise_if(is.numeric,mean)

df %>% group_by(Species) %>% summarise(Obs=n(),First=first(Sepal.Length),Last=last(Sepal.Length))

# Manipulate variables

select(df,starts_with("Sep"))

select(df,contains("Sep"))

select(df,-Species)

select(df,matches("Sep"))

select(df,Species,everything())

# Make new variables

mutate(mtcars,gpm=1/mpg)

transmute(mtcars,gpm=1/mpg)

ff <- tbl_df(faithful)

mutate_all(ff,funs(log(.),log2(.)))

mutate_at(df,-Species,funs(log(.)))

mutate_if(df,is.numeric,funs(log(.)))

rename(df,Length=Sepal.Length)

mutate(df,SET=ifelse(Species=="setosa",T,F))
select(df,-Species) %>% mutate_all(funs(cumsum(.)))








