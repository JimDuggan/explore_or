# make a list of data frame

l <- mpg %>% group_split(class)

m <- map(l, function(df) lm(hwy ~ displ, data = df))

m %>% map(summary) %>% map_dbl()
