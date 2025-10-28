# Chapter 2: Vectors


# Create and display a logical vector
x_logi <- c(TRUE, T, FALSE, TRUE, F)
x_logi

typeof(x_logi)

str(x_logi)

is.logical(x_logi)


# Create and display an integer vector
x_int <- c(2L, 4L, 6L, 8L, 10L)
x_int

typeof(x_int)

str(x_int)

is.integer(x_int)

# Create and display a double vector
x_dbl<- c(1.2, 3.4, 7.2, 11.1, 12.7)
x_dbl

typeof(x_dbl)

str(x_dbl)

is.double(x_dbl)

# Create and display a character vector
x_chr<- c("One","Two","Three","Four","Five")
x_chr

typeof(x_chr)

str(x_chr)

is.character(x_chr)

# Create vector 1
v1 <- c(1,2,3)
# Create vector 2
v2 <- c(4,5,6)

# Append vectors to create vector 3
v3 <- c(v1, v2)
v3

# Append vectors to create vector 4
v4 <- c(v2, v1)
v4


# Creating larger vectors
x <- 1:10
x

typeof(x)
length(x)

x0 <- seq(1,10)
x0

x1 <- seq(from=1, to=10)
x1

x2 <- seq(from=1, to=5, by=.5)
x2

x3 <- seq(from=1, to=10, by=2)
x3

x4 <- seq(from=1, length.out=10)
x4

x5 <- seq(length.out=10)
x5


# use rep to initialize a vector to zeros
z1 <- rep(0,10)
z1

# use rep to initialize with a pattern of values
z2 <- rep(c("A","B"),5)
z2


# Use the vector() function to create a vector of a fixed length. 

y1 <- vector("logical",   length = 3)
y1

y2 <- vector("integer",   length = 3)
y2

y3 <- vector("double",   length = 3)
y3

y4 <- vector("character", length = 3)
y4




# Create a double vector with named elements
x_dbl<- c(a=1.2, b=3.4, c=7.2, d=11.1, e=12.7)

x_dbl

summary(x_dbl)


# Extract the names of the x_dbl vector
x_dbl_names <- names(x_dbl)

typeof(x_dbl_names)

x_dbl_names


# define a vector v
v <- 1:10
v

# Simulate a missing value by setting the final value to NA
v[10] <- NA
v

# Notice how summary() deals with the NA value
summary(v)

# Notice what happens when we try to get the maximum value of v
max(v)


v
# Look for missing values in the vector v
is.na(v)


v
max(v, na.rm = TRUE)


# Define two sample vectors, v1 and v2
v1 <- c(10, 20, 30)
v1
v2 <- c(2, 4, 3)
v2

# Adding two vectors together 
v1 + v2

# Vector subtraction
v1 - v2

# Vector multiplication
v1 * v2

# Vector division
v1 / v2

# Vector exponentiation
v1 ^ v2

# Integer division, returns a whole number 
v1 %/% 7

# Modulus, returns the remainder 
v1 %% 7


# Setup a test vector
v5 <- c(5,1,4,2,6,8)
v5

# Test for all six relational operators
v5 < 4

v5 <= 4

v5 > 4

v5 >= 4

v5 == 4

v5 != 4

# Create a vector of numbers from 1 to 10
v <- 1:10
v

# Calculate the mean
m_v <- mean(v)
m_v

# Create a new vector des_v based on a condition, and using ifelse()
des_v <- ifelse(v > m_v, "GT", "LE")
des_v



# Create a list
l1 <- list(1:2,c(TRUE, FALSE),list(3:4,5:6))
# Display the list.
l1
# Show the list type
typeof(l1)
# Summarize the list structure 
str(l1)
# Confirm the number of elements
length(l1)



# Create a list
l2 <- vector(mode="list",length=3)
# Summarize the list structure 
str(l2)
# Confirm the number of elements
length(l2)


# Create a list
l1 <- list(el1=1:2,
           el2=c(TRUE, FALSE),
           el3=list(el3_el1=3:4,el3_el2=5:6))
# Summarize the list structure 
str(l1)
# Show the names of the list elements
names(l1)

# Create a list
l3 <- list(1:4,c(TRUE, FALSE),list(2:3,6:7))
# Convert to an atomic vector
l3_av <- unlist(l3)
# Show the result and the type
l3_av
typeof(l3_av)
