Chapter 6 Examples - S3 Object System
================

You may have noticed that if you call `summary()` with two different
types of data, you will get two different answers.

The results of a linear model.

``` r
mod <- lm(mpg~disp,data=mtcars)
summary(mod)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ disp, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.8922 -2.2022 -0.9631  1.6272  7.2305 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 29.599855   1.229720  24.070  < 2e-16 ***
    ## disp        -0.041215   0.004712  -8.747 9.38e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.251 on 30 degrees of freedom
    ## Multiple R-squared:  0.7183, Adjusted R-squared:  0.709 
    ## F-statistic: 76.51 on 1 and 30 DF,  p-value: 9.38e-10

Compared to the results from processing a data frame.

``` r
d <- subset(mtcars,select=c("mpg","disp")) |> head()
summary(d)
```

    ##       mpg             disp      
    ##  Min.   :18.10   Min.   :108.0  
    ##  1st Qu.:19.27   1st Qu.:160.0  
    ##  Median :21.00   Median :192.5  
    ##  Mean   :20.50   Mean   :211.8  
    ##  3rd Qu.:21.30   3rd Qu.:249.8  
    ##  Max.   :22.80   Max.   :360.0

An S3 object is a base type *with a defined class attribute*, and we can
explore this by looking at the `class` attribute associated with a data
frame.

``` r
# Show the class attribute using attr
attr(mtcars,"class")
```

    ## [1] "data.frame"

``` r
# Show the class attribute using class
class(mtcars)
```

    ## [1] "data.frame"

An example of a generic function is `summary()`, and two (of the many)
methods that belong to this generic function include `summary.lm()` and
`summary.data.frame()`. Notice that the methods that belong to the
`summary()` generic function have the format *summary.class_name(object,
arg1, …)*.

Here we show a simple example of defining a class and creating a new
method based on the generic function `print()`.

``` r
# define an atomic vector
v <- c(10.1, 31.2)
# Show v at the console
v
```

    ## [1] 10.1 31.2

``` r
# Add a class attribute
class(v) <- "my_new_class"

# Implement a print method for this class, and load.
print.my_new_class <- function(o){
  cat("Hello World!\n")
}
# Show v again at the console
v
```

    ## Hello World!
