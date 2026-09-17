# Filter the list sw_people (87 elements), contained in 
# repurrrsive to include only those whose height is not 
# unknown. 
# 
# Use an atomic vector has_height to filter the list, 
# and populate this vector using a loop structure. 
# This new list (sw_people1) should have 81 elements

library(repurrrsive)

has_height <- vector(mode="logical",
                     length=length(sw_people))

for(i in seq_along(sw_people)){
  cat("P= ",sw_people[[i]]$name,
      "H= ",sw_people[[i]]$height,"\n")
  if(sw_people[[i]]$height != "unknown")
    has_height[i] <- TRUE
}

sw_people1 <- sw_people[has_height]

characters <- c()
# Find those whose height is greater than 225
height_target <- 225

for(i in seq_along(sw_people1)){
  h_tmp <- as.integer(sw_people1[[i]]$height)
  if(h_tmp >= height_target){
    # browser()
    characters <- c(characters,sw_people1[[i]]$name)
  }
}

cat(characters)

