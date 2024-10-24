r_row <- sample(nrow(mtcars),2)
r_col <- sample(ncol(mtcars),2)

mtcars[r_row,r_col] <- NA

mtcars[!complete.cases(mtcars),]

