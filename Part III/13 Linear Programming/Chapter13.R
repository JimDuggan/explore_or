library(lpSolve)

# The Reddy Mikks Example

z <- c(3,2)



cons <- matrix(c(1,2,
                 2,1,
                 -1,1,
                 0,1),byrow = T,nrow=4)

eql <- c("<=", "<=", "<=","<=")

rhs <- c(6,8,1,2)

opt <- lp("max",z,cons,eql,rhs)
cat(opt$objval,"\n")
cat(opt$solution,"\n")
