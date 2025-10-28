# Chapter 5: Matrices and Data Frames


# Create a 3-by-3 matrix.

set.seed(100)
data <- sample(1:9)
data
m1 <- matrix(data,
             nrow = 3, 
             ncol=3,
             dimnames = list(c("R1","R2","R3"),
                             c("C1","C2","C3")))
# Display the matrix
m1

# Show the number of rows and columns
nrow(m1)
ncol(m1)

# Show the matrix dimensions
dim(m1)

# Add a row
m1_r <- rbind(m1,c(1,2,3))
rownames(m1_r)[4] <- "R4"
m1_r

# Add a column
m1_c <- cbind(m1_r,c(10,20,30,40))
colnames(m1_c)[4] <- "C4"
m1_c

# Extract the value in row 2, column 2
m1 [2,2]

m1[1:2,1:2]

# Extract first row and all columns
m1[1,]

# Extract first column, returned as a vector
m1[,1]

# Extract all rows and the first column, returned as matrix
m1[,1,drop=FALSE]


# Extract first row and first two columns
m1["R1",c("C1","C2")]
# Extract all rows and first two columns
m1[,c("C1","C2")]

# Operations on matrices

A <- matrix(1:4,
            nrow=2,
            dimnames = list(c("A_R1","A_R2"),c("A_C1","A_C2")))
B <- matrix(1:4,
            nrow=2,
            byrow = T, 
            dimnames = list(c("B_R1","B_R2"),c("B_C1","B_C2")))
A

B

# Multiplication of A and B
A*B

# Addition of A and B
A+B

# Multiplying A by a constant
10*A

# Use matrix algebra to multiply two matrices
A%*%B

dimnames(A)

rownames(A)

colnames(A)

rowSums(A)
rowMeans(A)
colSums(A)
colMeans(A)

# Data frames {#ch5-data-frames}

d <- data.frame(Number=1:5,
                Letter=LETTERS[1:5],
                Flag=c(T,F,T,F,T),
                stringsAsFactors = F)
d

summary(d)

# To select the first two rows from the data frame.
d[1:2,]


# To select all rows that have the column `Flag` set to true.


d[d$Flag == T,]


# To select the first two rows and the last two columns.

d[1:2,c("Letter","Flag")]

# dd a new column, we can simply add a new element as we would with a list.

d1 <- d
d1$letter <- letters[1:5]
d1


# Using the function subset() to filter a data frame
subset(mtcars,mpg>32,select=c("mpg","disp"))


# A tibble is a newer version of a data frame

library(tibble)

d1 <- tibble(Number=1:5,
             Letter=LETTERS[1:5],
             Flag=c(T,F,T,F,T))
d1

# There are some differences. Nicer output, and column not dropped 

# Subset the data frame
d[1:2,"Letter"]
# Subset the tibble
d1[1:2,"Letter"]

# Can easily convert between both

str(as_tibble(d))
str(as.data.frame(d1))

# The apply function is often used on data frames & matrices
# It operates on either a row (1) or column (2) basis

set.seed(100)
grades <- sample(30:90,15,replace = T)
results <- matrix(grades,nrow=5)
rownames(results) <- paste0("St-",1:5)
colnames(results) <- paste0("Sub-",1:3)
results

max_gr_subject <- apply(results,             # the matrix
                        2,                   # 2 for columns
                        function(x)max(x))   # the function to apply
max_gr_subject



max_gr_student <- apply(results,             # the matrix
                        1,                   # 1 for rows
                        function(x)max(x))   # the function to apply
max_gr_student
