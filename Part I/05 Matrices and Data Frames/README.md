Chapter 5 Examples - Matrices and Data Frames
================

### Matrices

In R, a matrix is a two-dimensional structure is created using the
`matrix()` function, with the following arguments:

- `data`, which are the initial values, contained in an atomic vector,
  supplied to the matrix,
- `nrow`, the desired number of rows,
- `ncol`, the desired number of columns,
- `byrow`, a logical value (default is FALSE), that specifies what way
  to fill the matrix with data, either filled by row or by column,
- `dimnames`, a list of length 2 giving row and column names
  respectively.

We now use this information to create a 3-by-3 matrix.

``` r
set.seed(100)
data <- sample(1:9)
data
```

    ## [1] 7 6 3 1 2 5 9 4 8

``` r
m1 <- matrix(data,
             nrow = 3, 
             ncol=3,
             dimnames = list(c("R1","R2","R3"),
                             c("C1","C2","C3")))
# Display the matrix
m1
```

    ##    C1 C2 C3
    ## R1  7  1  9
    ## R2  6  2  4
    ## R3  3  5  8

``` r
# Show the number of rows and columns
nrow(m1)
```

    ## [1] 3

``` r
ncol(m1)
```

    ## [1] 3

``` r
# Show the matrix dimensions
dim(m1)
```

    ## [1] 3 3

To subset a matrix, we supply an index for each dimension `[`row number,
column number`]`, for example, here we extract the value contained in
row 2, column 2.

``` r
m1
```

    ##    C1 C2 C3
    ## R1  7  1  9
    ## R2  6  2  4
    ## R3  3  5  8

``` r
# Extract the value in row 2, column 2
m1[2,2]
```

    ## [1] 2

Other examples of subsetting include:

``` r
# Extract first row and all columns
m1[1,]
```

    ## C1 C2 C3 
    ##  7  1  9

``` r
# Extract first column, returned as a vector
m1[,1]
```

    ## R1 R2 R3 
    ##  7  6  3

Matrix algebra operations are also supported:

``` r
A <- matrix(1:4,
            nrow=2)
B <- matrix(1:4,
            nrow=2,
            byrow = T)
A
```

    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4

``` r
B
```

    ##      [,1] [,2]
    ## [1,]    1    2
    ## [2,]    3    4

``` r
# Use matrix algebra to multiply two matrices
A%*%B
```

    ##      [,1] [,2]
    ## [1,]   10   14
    ## [2,]   14   20

### Data Frames

On an intuitive level, a data frame is similar to a matrix, with a
two-dimensional row and column structure, while on a technical level, a
data frame is a list. Crucially, the elements (columns) of a data frame
can be of different types, and this feature provides functionality for
processing datasets as part of the operations research process.

Here is a data frame:

``` r
d <- data.frame(Number=1:5,
                Letter=LETTERS[1:5],
                Flag=c(T,F,T,F,T),
                stringsAsFactors = F)
d
```

    ##   Number Letter  Flag
    ## 1      1      A  TRUE
    ## 2      2      B FALSE
    ## 3      3      C  TRUE
    ## 4      4      D FALSE
    ## 5      5      E  TRUE

``` r
summary(d)
```

    ##      Number     Letter             Flag        
    ##  Min.   :1   Length:5           Mode :logical  
    ##  1st Qu.:2   Class :character   FALSE:2        
    ##  Median :3   Mode  :character   TRUE :3        
    ##  Mean   :3                                     
    ##  3rd Qu.:4                                     
    ##  Max.   :5
