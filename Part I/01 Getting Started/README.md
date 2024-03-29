Chapter 1 - Getting Started with R
================

Once you have installed R, and an IDE such as RStudio, it is useful to
explore how you can create an manipulate data.

The following code assigns the value 25 to the variable `x` and displays
it. It then creates a new variable `y` that uses the value if `x`, and
then displays this.

``` r
# Assign 25 to  x
x <- 25
# Display x
x
```

    ## [1] 25

``` r
# Add 21 to x and store the result y
y <- x + 25
# Display y
y
```

    ## [1] 50

We can create a new variable `v` which is known as an atomic vector.
This means it can contain more than one value. The function `c()`
creates a vector.

``` r
# Call the function c() 
# Store the result in the variable v
v <- c(10, 20, 30)
# Display v
v
```

    ## [1] 10 20 30

We can now use other R functions to process the variable `v`, for
example, the functions `sum()`, `mean()`, and `sqrt()`. The results are
shown below.

``` r
sum(v)
```

    ## [1] 60

``` r
mean(v)
```

    ## [1] 20

``` r
sqrt(v)
```

    ## [1] 3.162278 4.472136 5.477226
