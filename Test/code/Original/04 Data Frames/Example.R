rows <- sample(nrow(mtcars),4)
cols <- sample(ncol(mtcars),2)

mtcars[rows,cols] <- -999

clean <- data.frame(apply(mtcars,2,function(x){
  browser()
  ifelse(x<0, NA, x)
}))
