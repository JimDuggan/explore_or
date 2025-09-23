library(repurrrsive)
# Store directors names in a vector
v1 <- c(sw_films[[1]][["director"]],
        sw_films[[2]][[4]],
        sw_films[[3]]$director,
        sw_films[[4]]$director,
        sw_films[[5]]$director,
        sw_films[[6]]$director,
        sw_films[[7]]$director)

v2 <- c()

for (i in seq_along(sw_films)){
  v2 <- c(v2,sw_films[[i]]$director)
  cat("i = ",i,"\n")
}

v3 <- vector(mode="character",length=length(sw_films))

for (i in seq_along(sw_films)){
  v3[i] <- sw_films[[i]]$director
  cat("i = ",i,"\n")
}


# Filter the list to only include George Lucas movies

lv <- c(T,T,T,T,F,F,F)
gl_sw_films <- sw_films[lv]

lv2 <- vector(mode="logical",length=length(sw_films))

for (i in seq_along(sw_films)){
  if(sw_films[[i]]$director == "George Lucas")
    lv2[i] <- TRUE
}

gl2_sw_films <- sw_films[lv2]

# Store names of these movies

gl_n <- vector(mode="character",
               length=length(gl2_sw_films))

for(i in seq_along(gl2_sw_films)){
  gl_n[i] <- gl2_sw_films[[i]]$title
}

gl2_n <- vector(mode="character",
               length=length(sw_films))

for(i in seq_along(sw_films)){
  if(sw_films[[i]]$director == "George Lucas")
    gl2_n[i] <- sw_films[[i]]$title
  else
    gl2_n[i] <- NA
}


sw_p_has_height <- vector(mode="logical",
                          length=length(sw_people))

for(i in seq_along(sw_people)){
  cat("name = ", sw_people[[i]]$name)
  cat("height = ", sw_people[[i]]$height,"\n")
  if(sw_people[[i]]$height != "unknown")
    sw_p_has_height[i] <- TRUE
}

sw_people1 <- sw_people[sw_p_has_height]



