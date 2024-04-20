Chapter 10 Examples - Processing Data with purrr
================

The `tidyverse` package `purrr` provides a comprehensive set of
functions that can be used to iterate over data structure.

The idea of the `map()` function is to provide a mechanism to iterate
over an input list or a vector. The general format of this function is
`map(.x, .f)`, where:

- `.x` is a list, or an atomic vector. If .x has named elements, the
  return value will preserve those names.
- `.f` can be a function, formula, or vector.

``` r
library(purrr)

o1 <- purrr::map(c(1,2,3,2),function(x)x^2)
str(o1)
```

    ## List of 4
    ##  $ : num 1
    ##  $ : num 4
    ##  $ : num 9
    ##  $ : num 4

A *formula* (which is defined by `~`) can be used as a function argument
too.

``` r
o2 <- purrr::map(c(1,2,3,2),~.x^2)
str(o2)
```

    ## List of 4
    ##  $ : num 1
    ##  $ : num 4
    ##  $ : num 9
    ##  $ : num 4

``` r
o3 <- purrr::map(c(1,2,3,2),~.^2)
str(o3)
```

    ## List of 4
    ##  $ : num 1
    ##  $ : num 4
    ##  $ : num 9
    ##  $ : num 4

The package `purrr` provides a set of additional functions that specify
the result type (e.g. double, character)

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(purrr)
mtcars %>%
  dplyr::select(mpg,cyl,disp) %>%
  purrr::map_dbl(mean)
```

    ##       mpg       cyl      disp 
    ##  20.09062   6.18750 230.72188

``` r
library(repurrrsive)
library(purrr)
sw_films %>%
  purrr::map_chr(~.x$director) %>%
  unique()
```

    ## [1] "George Lucas"     "Richard Marquand" "Irvin Kershner"   "J. J. Abrams"

You can also iterate over two input vectors using `map2()`

``` r
means <- c(10,20,30)
sds   <- c(2,4,7)

purrr::map2(means,sds,~rnorm(5,.x,.y)) %>% str()
```

    ## List of 3
    ##  $ : num [1:5] 11.82 11.36 9.28 14.62 9.76
    ##  $ : num [1:5] 15.5 16 21.2 19 27
    ##  $ : num [1:5] 20.2 26.6 18.5 29.1 41.7

The function `group_split()` can be used to generate a list, which then
can be processed with `map()`. Here we perform correlation analysis
between windspeed and mean sea level pressure (we would expect a
negative relationship).

``` r
library(aimsir17)
d_data <- observations %>%
           dplyr::filter(complete.cases(observations)) %>%
           dplyr::group_by(station,month,day) %>%
           dplyr::summarize(MaxWdsp=max(wdsp,na.rm=TRUE),
                            DailyAverageMSL=mean(msl,na.rm=TRUE)) %>%
           dplyr::ungroup()
d_data
```

    ## # A tibble: 8,394 × 5
    ##    station month   day MaxWdsp DailyAverageMSL
    ##    <chr>   <dbl> <int>   <dbl>           <dbl>
    ##  1 ATHENRY     1     1      12           1027.
    ##  2 ATHENRY     1     2       8           1035.
    ##  3 ATHENRY     1     3       6           1032.
    ##  4 ATHENRY     1     4       4           1030.
    ##  5 ATHENRY     1     5       9           1029.
    ##  6 ATHENRY     1     6       9           1028.
    ##  7 ATHENRY     1     7       6           1032.
    ##  8 ATHENRY     1     8       9           1029.
    ##  9 ATHENRY     1     9      16           1015.
    ## 10 ATHENRY     1    10      13           1013.
    ## # ℹ 8,384 more rows

``` r
cor7 <- d_data %>%
         dplyr::group_by(station) %>%
         dplyr::group_split() %>%
         purrr::map_df(~{
                  corr <- cor(.x$MaxWdsp,.x$DailyAverageMSL)
                  tibble(Station=first(.x$station),
                         CorrCoeff=corr)
         }) %>%
         dplyr::arrange(CorrCoeff) %>%
         dplyr::slice(1:7)
```

``` r
cor7
```

    ## # A tibble: 7 × 2
    ##   Station              CorrCoeff
    ##   <chr>                    <dbl>
    ## 1 SherkinIsland           -0.589
    ## 2 VALENTIA OBSERVATORY    -0.579
    ## 3 ROCHES POINT            -0.540
    ## 4 MACE HEAD               -0.539
    ## 5 MOORE PARK              -0.528
    ## 6 SHANNON AIRPORT         -0.524
    ## 7 CORK AIRPORT            -0.522
