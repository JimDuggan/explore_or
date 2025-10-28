set.seed(100)
cx_100 <- rnorm(10,76,3)
cx_101 <- rnorm(10,66,1)
cx_102 <- rnorm(10,86,7)
cx_103 <- rnorm(10,56,10)

grades <- cbind(cx_100,
                cx_101,
                cx_102,
                cx_103)

rownames(grades) <- paste0("St_",1:nrow(grades))

# Get all teh results for stuent 1




