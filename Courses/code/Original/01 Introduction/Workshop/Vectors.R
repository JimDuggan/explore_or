# Create an R vector of squares of 1 to 10
# Find the minimum
# Find the maximum
# Find the average
# Subset all those values greater than the average

v <- (1:10)^2

min_v <- min(v)

max_v <- max(v)

mean_v <- mean(v)

lv <- v > mean_v

ans <- v[lv]
