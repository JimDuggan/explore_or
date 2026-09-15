library(repurrrsive)
length(sw_films)
# show the list elements for 1st element
names(sw_films[[1]])

# Get the first film name and movie director
sw_films[[1]][[1]]
sw_films[[1]][[4]]

# Get the last film name and movie director
sw_films[[length(sw_films)]][[1]]
sw_films[[length(sw_films)]][[4]]


# Get the first film name and movie director
sw_films[[1]]$title
sw_films[[1]]$director

# Get the last film name and movie director
sw_films[[length(sw_films)]]$title
sw_films[[length(sw_films)]]$director


# Search for movies by George Lucas and store these in a new list
target <- "George Lucas"
# Create a logical vector to hold information for positive matches 
is_target <- vector(mode="logical",length = length(sw_films))
# Iterate through the entire sw_films list (of 7)
for(i in seq_along(sw_films)){
  is_target[i] <- sw_films[[i]]$director == target
}
target_list <- sw_films[is_target]

is_target
length(target_list)

# Create a movies vector to store the movie names
movies <- vector(mode="character",length = length(target_list))
# Iterate through the list to extract the movie title
for(i in seq_along(target_list)){
  movies[i]<-target_list[[i]]$title
}
movies

