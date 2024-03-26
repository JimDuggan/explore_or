Chapter 3 Examples - Subsetting vectors
================

Subsetting operators allow you to process data stored in atomic vectors
and lists and R provides a range of flexible approaches that can be used
to subset data.

To show subsetting examples in R, we focus on the *atomic vector*, and
define the following vector that simulates daily arrivals at a
restaurant (Poisson process):

``` r
# set the seed
set.seed(111)
# Generate the count data, assume a Poisson distribution
customers <- rpois(n = 10, lambda = 100)
# Name each successive element to be the day number
names(customers) <- paste0("D",1:10)
customers
```

    ##  D1  D2  D3  D4  D5  D6  D7  D8  D9 D10 
    ## 102  96  97  98 101  85  98 118 102  94

- **Positive integers** will subset atomic vector elements at given
  locations, and this type of index can have one or more values.

``` r
# Get the customer from day 1
customers[1]
```

    ##  D1 
    ## 102

``` r
# Get the customers from day 1 through day 5
customers[1:5]
```

    ##  D1  D2  D3  D4  D5 
    ## 102  96  97  98 101

``` r
# Use c() to get the customers from day 1 and the final day
customers[c(1,length(customers))]
```

    ##  D1 D10 
    ## 102  94

``` r
# Note, with c(), any duplicates will be returned
customers[c(1:3,3,3)]
```

    ##  D1  D2  D3  D3  D3 
    ## 102  96  97  97  97

- **Negative integers** can be used to exclude elements from a vector,
  and one or more elements can be excluded. Here are some examples using
  the `customers` atomic vector.

``` r
# Exclude the first day's observation
customers[-1]
```

    ##  D2  D3  D4  D5  D6  D7  D8  D9 D10 
    ##  96  97  98 101  85  98 118 102  94

``` r
# Exclude the first and last day
customers[-c(1,length(customers))]
```

    ##  D2  D3  D4  D5  D6  D7  D8  D9 
    ##  96  97  98 101  85  98 118 102

``` r
# Exclude all values except the first and last day
customers[-(2:(length(customers)-1))]
```

    ##  D1 D10 
    ## 102  94

- **Logical vectors** can be used to subset a vector, and this is a
  powerful feature of R, as it allows for the use of relational and
  logical operators to perform subsetting. For example, the code below
  will find any value that is greater than 100.

``` r
# Create a logical vector based on a relation expression
lv <- customers > 100
lv
```

    ##    D1    D2    D3    D4    D5    D6    D7    D8    D9   D10 
    ##  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE

``` r
# Filter the original vector based on the logical vector
customers[lv]
```

    ##  D1  D5  D8  D9 
    ## 102 101 118 102

- **Named elements** where if a vector has named elements, often set via
  the function `names()`, then elements can subsetted using their names.

``` r
customers
```

    ##  D1  D2  D3  D4  D5  D6  D7  D8  D9 D10 
    ## 102  96  97  98 101  85  98 118 102  94

``` r
# Show the value from day 10
customers["D10"]
```

    ## D10 
    ##  94

``` r
# Extract the first and last elements
customers[c("D1","D10")]
```

    ##  D1 D10 
    ## 102  94
