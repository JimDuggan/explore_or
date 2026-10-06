v1 <- 1:9
# Create the matrix
m <- matrix(v1,nrow=3)


colnames(m) <- LETTERS[1:ncol(m)]
rownames(m) <- letters[1:nrow(m)]

# Subset examples
m[1,1]
