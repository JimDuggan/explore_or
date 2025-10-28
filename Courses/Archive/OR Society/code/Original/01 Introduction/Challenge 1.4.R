# Create a vector of 20 numbers
# Set 5 of these to NA (random)
# Print the locations of the missing values
# Hint: Check out the R function which

v <- sample(1:100,20,replace = T)

t <- sample(1:20,5,replace = F)

v[t] <- NA

check <- which(is.na(v))



