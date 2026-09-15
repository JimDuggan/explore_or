# Find and George Lucas movies

library(repurrrsive)

gl_true <- vector(mode="logical",
                  length=length(sw_films))

for(i in seq_along(sw_films)){
  # x <- sw_films[[i]]
  if (sw_films[[i]]$director=="George Lucas")
    gl_true[i] <- TRUE
  # cat("Index = ",i,"\n")
  # cat("Director = ",x$director,"\n")
  # cat("Movie = ",x$title,"\n\n")
}

gl_sw_films <- sw_films[gl_true]

gl_films <- vector(mode="character",
                   length=length(gl_sw_films))

for(i in seq_along(gl_sw_films)){
  gl_films[i] <- gl_sw_films[[i]]$title
  gl_films[i] <- gl_sw_films[[i]][[1]]
  gl_films[i] <- gl_sw_films[[i]][["title"]]
}

cat("GL films are\n",paste0(gl_films,"\n"))


