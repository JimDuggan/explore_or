Lecture 1 (Atomic Vectors) - Summary
================

Here are some of the key points from the lecture. See also the sample
code solutions in the code folder.

- Atomic vectors have only one data type.

``` r
v1 <- 1:5
str(v1)
```

    ##  int [1:5] 1 2 3 4 5

``` r
v2 <- c(T,F)
str(v2)
```

    ##  logi [1:2] TRUE FALSE

- When combining different data types in a vector, R will coerce to the
  most flexible data type

``` r
v3 <- c(v1, v2)
str(v3)
```

    ##  int [1:7] 1 2 3 4 5 1 0
