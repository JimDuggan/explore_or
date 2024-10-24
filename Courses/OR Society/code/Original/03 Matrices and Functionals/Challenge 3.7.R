set.seed(10)
N=10
cs1 <- rnorm(N,72,10)
cs2 <- rnorm(N,65,7)
cs3 <- rnorm(N,80,9)
cs4 <- rnorm(N,55,7)
cs5 <- rnorm(N,61,5)

data <- cbind(cs1, cs2, cs3, cs4, cs5)

rownames(data) <- paste0("Student_",1:N)

data <- cbind(data,apply(data,1,min))

colnames(data)[ncol(data)] <- "Avr"


