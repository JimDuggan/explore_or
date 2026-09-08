set.seed(100)
N <- 100000
d1 <- sample(1:6,N,replace = T)
d2 <- sample(1:6,N,replace = T)

sum_dice <- d1 + d2

fr <- table(sum_dice)

p_fr <- fr/length(sum_dice)

