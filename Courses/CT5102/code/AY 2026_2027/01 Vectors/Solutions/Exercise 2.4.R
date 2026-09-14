# Generate a random sample of 20 temperatures (assume integer values in 
# the range −5 to 30) using the sample() function (set.seed(99)). 
# Assume that temperatures less than 4 are cold, 
# temperatures greater that 25 are hot, and all 
# others are medium; use the ifelse() function to generate the 
# solution vector. Note that an ifelse() call can be nested 
# within another ifelse() call.

set.seed(99)
# Min_Temp <- -5
# Max_Temp <- 30
N <- 20

temp <- sample(-5:30,N,replace=TRUE)

des <- ifelse(temp < 4,"Cold",
              ifelse(temp > 25,"Hot","Medium"))

cat("The solution is \n",des)




