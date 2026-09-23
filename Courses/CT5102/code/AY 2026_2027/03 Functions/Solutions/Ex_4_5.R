# Use lapply() followed by an appropiate 
# post-processing function call, to generate the following output, 
# based on the input list.

l1 <- list(a=1:5,b=100:200,c=1000:5000)

# Method 1
res1 <- vector(mode="numeric", length=length(l1))

for(i in seq_along(l1)){
  res1[i] <- mean(l1[[i]])
}

cat("Means are...",res1,"\n")

res2 <- lapply(l1,function(x)mean(x))
res2 <- unlist(res2)
cat("lapply means are...",res2,"\n")

res3 <- sapply(l1,function(x)mean(x))
cat("sapply means are...",res2,"\n")

library(repurrrsive)
mv <- sapply(sw_films,function(x){
  paste0("Episode = ",x$episode_id," Title= ",x$title)
})

mv2 <- lapply(sw_films,function(x){
   c(Epi=x$episode_id,Title=x$title)
})

mv3 <- lapply(sw_films,function(x){
  list(Epi=x$episode_id,Title=x$title)
})





