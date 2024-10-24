# Create a vector of 10 elements

x1 <- c(1,2,3,4,5,6,7,8,9,10)

x2 <- 1:10

x3 <- seq(1,10)

# x3 <- seq(1,10,by=.001)

# There are 4 ways to subset
# Positive integer
x1[c(1,5,10)]
x1[3:1]

# Negative integer
x1[-(3:4)]
x1[-1]

# Logical Vector
v <- 20:25
fv <- c(T,T,T,F,T,T)
v[fv]

fv1 <- c(T,F)
v[fv1]

x <- 1:5
w <- 30:40

w[w>35]
w[w==35 | w ==31]

# Strings
x <- 1:5
# Replacement function, here we can set
names(x) <- c("a","b","c","d","e")

# Replacement function, here we can get
names(x)
x["d"]

# How can we get the first and third element using strings?
x[c("a","c")]

# ifelse (vectorised)
x <- 1:10

nv <- ifelse(x %% 2 ==1,"Odd","Even")

# sample function
set.seed(100)
s1 <- sample(1:6,100,replace = T)
ans <- table(s1)
ans

set.seed(200)
s2 <- sample(c("Arts","Science","Medicine"),100,
             prob = c(.4,.4,.2),replace = T)

# NA function
a <- 90:100
a[5] <- NA
a[!is.na(a)]
sum(is.na(a))
which(c(T,T,F,T))
which(is.na(a))



















