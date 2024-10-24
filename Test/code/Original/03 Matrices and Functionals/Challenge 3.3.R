# Create a 10x10 matrix to represent connections between 
# people on social media (random seed=100)
# Label the people [A..J], with named rows and columns.
# Randomly populate the matrix with 1s and 0s. 
# The number 1 means someone follows/is followed by another person.  
# Ensure that all diagonals are 0 (you should use an 
# appropriate R matrix operation for this).
# Each row contains information on the people a person follows. 
# Each column contains information on who follows a person. 
library(igraph)
set.seed(100)
v <- sample(0:1,100,replace = T)
m <- matrix(v,nrow=10)

rownames(m) <- LETTERS[1:10]
colnames(m) <- LETTERS[1:10]

diag(m) <- 0

g1 <- graph_from_adjacency_matrix( m )

plot(g1)

m["A",] <- 0
m[,"J"]<-0

g1 <- graph_from_adjacency_matrix( m )

plot(g1)
