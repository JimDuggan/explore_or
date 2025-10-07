library(repurrrsive)

# Using lapply()

# (1) From sw_films, extract the opening crawl and copy this 
# into an atomic vector of characters

crawl <- lapply(sw_films,function(x1){
  x1$opening_crawl
}) |> unlist()

# Best solution
crawl <- sw_films |>
         lapply(function(x)x$opening_crawl) |>
         unlist()

get_crawl <- function(x){
  x$opening_crawl
}

crawl2 <- sw_films |>
  lapply(get_crawl) |>
  unlist()














# (2) From sw_people, extract the name and height 
# and store these as two parallel 
# atomic vectors

res1 <- sw_people |>
         lapply(function(x){
           c(Name=x$name,Height=x$height)
         })

sw_names <- res1 |>
            lapply(function(x)x["Name"]) |>
            unlist()

sw_heights <- res1 |>
              lapply(function(x)x["Height"]) |>
              unlist()

sw_heights[which(sw_names=="Luke Skywalker")]



# (3) From sw_planets, extract the orbital period as a number, and display the mean and sd


# (4) From sw_species, extract the names of those with the designation "sentient"


# (5) From sw_starships, extract the crew number, and display the mean and sd


# (6) From sw_vehicles, extract the name and the manufacturer into a list.

# (7) Explore adding extra parameters to lapply, for example, 
#     solving a quadratic equation ax^2+bx+c, where a, b, and c are 
#     passed to the function











