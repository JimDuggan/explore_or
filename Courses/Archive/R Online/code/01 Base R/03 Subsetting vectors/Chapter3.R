# Chapter 3: Subsetting Vectors



# set the seed
set.seed(111)
# Generate the count data, assume a Poisson distribution
customers <- rpois(n = 10, lambda = 100)
# Name each successive element to be the day number
names(customers) <- paste0("D",1:10)
customers

# Subsetting with positive integers 
# Get the customer from day 1
customers[1]

# Get the customers from day 1 through day 5
customers[1:5]

# Use c() to get the customers from day 1 and the final day
customers[c(1,length(customers))]

# Note, with c(), any duplicates will be returned
customers[c(1:3,3,3)]


# Subsetting with negative integers 
# Exclude the first day's observation
customers[-1]

# Exclude the first and last day
customers[-c(1,length(customers))]

# Exclude all values except the first and last day
customers[-(2:(length(customers)-1))]


# Subsetting with logical vectors 
# Create a logical vector based on a relation expression
lv <- customers > 100
lv

# Filter the original vector based on the logical vector
customers[lv]

# Subset the vector to only show values great than 100
customers[customers > 100]


# Recycle - Subset every second element from the vector
customers[c(TRUE,FALSE)]


# Subsetting with named elements 
# Show the vector unnamed
unname(customers)
# Show the vector with the element names
customers
# Show the value from day 10
customers["D10"]


# Use which() to find the indices of the true elements in the 
# logical vector
v <- which(customers > 100)
v

# Filter customers based on these indices
customers[v]

# Subsetting lists 

# Create a simple vector
l1 <- list(a="Hello",
           b=1:5,
           c=list(d=c(T,T,F),
                  e="Hello World"))
# Show the structure
str(l1)

# extract the first and third element of the list l1
str(l1[c(1,3)])

# exclude the first and third element of the list
str(l1[-c(1,3)])

# Show the first and third element using a logical vector
str(l1[c(TRUE,FALSE,TRUE)])

# Show the first element using a character vector
str(l1["a"])

# extract the contents of the first list element
l1[[1]]

# extract the contents of the second  list element
l1[[2]]

# extract the contents of the third list element (a list!)
str(l1[[3]])

# extract the contents of the first element of the third element
l1[[3]][[1]]

# extract the contents of the second element of the third element
l1[[3]][[2]]

# extract the contents of the first list element
l1[["a"]]

# extract the contents of the second  list element
l1[["b"]]

# extract the contents of the third list element (a list!)
str(l1[["c"]])

# extract the contents of the first element of the third element
l1[["c"]][["d"]]

# extract the contents of the second element of the third element
l1[["c"]][["e"]]


# extract the contents of the first list element
l1$a

# extract the contents of the second  list element
l1$b

# extract the contents of the third list element (a list!)
str(l1$c)

# extract the contents of the first element of the third element
l1$c$d

# extract the contents of the second element of the third element
l1$c$e
