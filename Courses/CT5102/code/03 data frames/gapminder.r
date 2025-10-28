library(gapminder)

gp <- gapminder

irl <- subset(gp,country=="Ireland")

irl <- subset(gp,country=="Ireland",
              select = c(year,pop))

# Filter for ireland - using select
# Extract year and population - using select
# Add new column which is the difference between
# observations for the population
# display the new data frame

res <- gapminder |>
         subset(country=="Ireland", 
                select=c(country,year,pop)) |>
         transform(DeltaPop=c(NA,diff(pop)))

res1 <- subset(gapminder,country=="Ireland")
res1 <- res1[,c("country","year","pop")]
res1$delta <- c(NA,diff(res1$pop))

sum <- gapminder |>
         lapply(function(x)if(is.double(x)) mean(x) 
                              else NA) |>
         unlist()





# 