Chapter 8 Examples - Data Transformation with dplyr
================

The package `dplyr` provides functions to support data transformations,
and also additional functions that can be used to summarize data.

First, we include the `dplyr` library, and the library `ggplot2`, which
contains the tibble `mpg`.

``` r
library(dplyr)
library(ggplot2)
```

### Filtering rows with `filter()`

The function `filter()` is used to subset a tibble, in which all rows
satisfying a condition are retained. This function conforms to the
*architecture* of `dplyr`, in that it accepts a tibble, and arguments,
and always returns a tibble. Note the use of the package name `dplyr::`
in these function calls is optional.

``` r
dplyr::filter(mpg,class=="2seater")
```

    ## # A tibble: 5 × 11
    ##   manufacturer model    displ  year   cyl trans    drv     cty   hwy fl    class
    ##   <chr>        <chr>    <dbl> <int> <int> <chr>    <chr> <int> <int> <chr> <chr>
    ## 1 chevrolet    corvette   5.7  1999     8 manual(… r        16    26 p     2sea…
    ## 2 chevrolet    corvette   5.7  1999     8 auto(l4) r        15    23 p     2sea…
    ## 3 chevrolet    corvette   6.2  2008     8 manual(… r        16    26 p     2sea…
    ## 4 chevrolet    corvette   6.2  2008     8 auto(s6) r        15    25 p     2sea…
    ## 5 chevrolet    corvette   7    2008     8 manual(… r        15    24 p     2sea…

``` r
dplyr::filter(mpg,class=="2seater",hwy >= 25)
```

    ## # A tibble: 3 × 11
    ##   manufacturer model    displ  year   cyl trans    drv     cty   hwy fl    class
    ##   <chr>        <chr>    <dbl> <int> <int> <chr>    <chr> <int> <int> <chr> <chr>
    ## 1 chevrolet    corvette   5.7  1999     8 manual(… r        16    26 p     2sea…
    ## 2 chevrolet    corvette   6.2  2008     8 manual(… r        16    26 p     2sea…
    ## 3 chevrolet    corvette   6.2  2008     8 auto(s6) r        15    25 p     2sea…

``` r
dplyr::filter(mpg, manufacturer == "lincoln" | 
                   manufacturer == "mercury")
```

    ## # A tibble: 7 × 11
    ##   manufacturer model       displ  year   cyl trans drv     cty   hwy fl    class
    ##   <chr>        <chr>       <dbl> <int> <int> <chr> <chr> <int> <int> <chr> <chr>
    ## 1 lincoln      navigator …   5.4  1999     8 auto… r        11    17 r     suv  
    ## 2 lincoln      navigator …   5.4  1999     8 auto… r        11    16 p     suv  
    ## 3 lincoln      navigator …   5.4  2008     8 auto… r        12    18 r     suv  
    ## 4 mercury      mountainee…   4    1999     6 auto… 4        14    17 r     suv  
    ## 5 mercury      mountainee…   4    2008     6 auto… 4        13    19 r     suv  
    ## 6 mercury      mountainee…   4.6  2008     8 auto… 4        13    19 r     suv  
    ## 7 mercury      mountainee…   5    1999     8 auto… 4        13    17 r     suv

``` r
dplyr::filter(mpg, manufacturer %in% c("lincoln","mercury"))
```

    ## # A tibble: 7 × 11
    ##   manufacturer model       displ  year   cyl trans drv     cty   hwy fl    class
    ##   <chr>        <chr>       <dbl> <int> <int> <chr> <chr> <int> <int> <chr> <chr>
    ## 1 lincoln      navigator …   5.4  1999     8 auto… r        11    17 r     suv  
    ## 2 lincoln      navigator …   5.4  1999     8 auto… r        11    16 p     suv  
    ## 3 lincoln      navigator …   5.4  2008     8 auto… r        12    18 r     suv  
    ## 4 mercury      mountainee…   4    1999     6 auto… 4        14    17 r     suv  
    ## 5 mercury      mountainee…   4    2008     6 auto… 4        13    19 r     suv  
    ## 6 mercury      mountainee…   4.6  2008     8 auto… 4        13    19 r     suv  
    ## 7 mercury      mountainee…   5    1999     8 auto… 4        13    17 r     suv

### Sorting rows with `arrange()`

The `arrange()` function orders the rows of a tibble by the values of
selected columns, and these can be in ascending order (the default), or
descending order, by using the function `desc()`.

``` r
dplyr::arrange(mpg,cty) %>% slice(1:3)
```

    ## # A tibble: 3 × 11
    ##   manufacturer model       displ  year   cyl trans drv     cty   hwy fl    class
    ##   <chr>        <chr>       <dbl> <int> <int> <chr> <chr> <int> <int> <chr> <chr>
    ## 1 dodge        dakota pic…   4.7  2008     8 auto… 4         9    12 e     pick…
    ## 2 dodge        durango 4wd   4.7  2008     8 auto… 4         9    12 e     suv  
    ## 3 dodge        ram 1500 p…   4.7  2008     8 auto… 4         9    12 e     pick…

``` r
dplyr::arrange(mpg,desc(cty)) %>% slice(1:3)
```

    ## # A tibble: 3 × 11
    ##   manufacturer model      displ  year   cyl trans  drv     cty   hwy fl    class
    ##   <chr>        <chr>      <dbl> <int> <int> <chr>  <chr> <int> <int> <chr> <chr>
    ## 1 volkswagen   new beetle   1.9  1999     4 manua… f        35    44 d     subc…
    ## 2 volkswagen   jetta        1.9  1999     4 manua… f        33    44 d     comp…
    ## 3 volkswagen   new beetle   1.9  1999     4 auto(… f        29    41 d     subc…

### Choosing columns with `select()`

The function `select()` allows you to subset columns from the input
tibble using the column names. Note that `select()` will always return
all of the observations for the selected columns.

``` r
dplyr::select(mpg,manufacturer,model,year,displ,cty)
```

    ## # A tibble: 234 × 5
    ##    manufacturer model       year displ   cty
    ##    <chr>        <chr>      <int> <dbl> <int>
    ##  1 audi         a4          1999   1.8    18
    ##  2 audi         a4          1999   1.8    21
    ##  3 audi         a4          2008   2      20
    ##  4 audi         a4          2008   2      21
    ##  5 audi         a4          1999   2.8    16
    ##  6 audi         a4          1999   2.8    18
    ##  7 audi         a4          2008   3.1    18
    ##  8 audi         a4 quattro  1999   1.8    18
    ##  9 audi         a4 quattro  1999   1.8    16
    ## 10 audi         a4 quattro  2008   2      20
    ## # ℹ 224 more rows

``` r
mpg %>% dplyr::select(manufacturer:year,cty)
```

    ## # A tibble: 234 × 5
    ##    manufacturer model      displ  year   cty
    ##    <chr>        <chr>      <dbl> <int> <int>
    ##  1 audi         a4           1.8  1999    18
    ##  2 audi         a4           1.8  1999    21
    ##  3 audi         a4           2    2008    20
    ##  4 audi         a4           2    2008    21
    ##  5 audi         a4           2.8  1999    16
    ##  6 audi         a4           2.8  1999    18
    ##  7 audi         a4           3.1  2008    18
    ##  8 audi         a4 quattro   1.8  1999    18
    ##  9 audi         a4 quattro   1.8  1999    16
    ## 10 audi         a4 quattro   2    2008    20
    ## # ℹ 224 more rows

``` r
mpg %>% dplyr::select(!(manufacturer:year))
```

    ## # A tibble: 234 × 7
    ##      cyl trans      drv     cty   hwy fl    class  
    ##    <int> <chr>      <chr> <int> <int> <chr> <chr>  
    ##  1     4 auto(l5)   f        18    29 p     compact
    ##  2     4 manual(m5) f        21    29 p     compact
    ##  3     4 manual(m6) f        20    31 p     compact
    ##  4     4 auto(av)   f        21    30 p     compact
    ##  5     6 auto(l5)   f        16    26 p     compact
    ##  6     6 manual(m5) f        18    26 p     compact
    ##  7     6 auto(av)   f        18    27 p     compact
    ##  8     4 manual(m5) 4        18    26 p     compact
    ##  9     4 auto(l5)   4        16    25 p     compact
    ## 10     4 manual(m6) 4        20    28 p     compact
    ## # ℹ 224 more rows

``` r
mpg %>% dplyr::select(c(manufacturer:year,cty))
```

    ## # A tibble: 234 × 5
    ##    manufacturer model      displ  year   cty
    ##    <chr>        <chr>      <dbl> <int> <int>
    ##  1 audi         a4           1.8  1999    18
    ##  2 audi         a4           1.8  1999    21
    ##  3 audi         a4           2    2008    20
    ##  4 audi         a4           2    2008    21
    ##  5 audi         a4           2.8  1999    16
    ##  6 audi         a4           2.8  1999    18
    ##  7 audi         a4           3.1  2008    18
    ##  8 audi         a4 quattro   1.8  1999    18
    ##  9 audi         a4 quattro   1.8  1999    16
    ## 10 audi         a4 quattro   2    2008    20
    ## # ℹ 224 more rows

``` r
mpg %>% dplyr::select(starts_with("m"))
```

    ## # A tibble: 234 × 2
    ##    manufacturer model     
    ##    <chr>        <chr>     
    ##  1 audi         a4        
    ##  2 audi         a4        
    ##  3 audi         a4        
    ##  4 audi         a4        
    ##  5 audi         a4        
    ##  6 audi         a4        
    ##  7 audi         a4        
    ##  8 audi         a4 quattro
    ##  9 audi         a4 quattro
    ## 10 audi         a4 quattro
    ## # ℹ 224 more rows

``` r
mpg %>% dplyr::select(contains("an"))
```

    ## # A tibble: 234 × 2
    ##    manufacturer trans     
    ##    <chr>        <chr>     
    ##  1 audi         auto(l5)  
    ##  2 audi         manual(m5)
    ##  3 audi         manual(m6)
    ##  4 audi         auto(av)  
    ##  5 audi         auto(l5)  
    ##  6 audi         manual(m5)
    ##  7 audi         auto(av)  
    ##  8 audi         manual(m5)
    ##  9 audi         auto(l5)  
    ## 10 audi         manual(m6)
    ## # ℹ 224 more rows

``` r
mpg %>% 
  dplyr::select(manufacturer:year,cty,hwy,everything())
```

    ## # A tibble: 234 × 11
    ##    manufacturer model      displ  year   cty   hwy   cyl trans drv   fl    class
    ##    <chr>        <chr>      <dbl> <int> <int> <int> <int> <chr> <chr> <chr> <chr>
    ##  1 audi         a4           1.8  1999    18    29     4 auto… f     p     comp…
    ##  2 audi         a4           1.8  1999    21    29     4 manu… f     p     comp…
    ##  3 audi         a4           2    2008    20    31     4 manu… f     p     comp…
    ##  4 audi         a4           2    2008    21    30     4 auto… f     p     comp…
    ##  5 audi         a4           2.8  1999    16    26     6 auto… f     p     comp…
    ##  6 audi         a4           2.8  1999    18    26     6 manu… f     p     comp…
    ##  7 audi         a4           3.1  2008    18    27     6 auto… f     p     comp…
    ##  8 audi         a4 quattro   1.8  1999    18    26     4 manu… 4     p     comp…
    ##  9 audi         a4 quattro   1.8  1999    16    25     4 auto… 4     p     comp…
    ## 10 audi         a4 quattro   2    2008    20    28     4 manu… 4     p     comp…
    ## # ℹ 224 more rows

### Adding columns with `mutate()`

The function `mutate()` adds new variables to a tibble, while keeping
the original ones.

To explore `mutate()`, we take a reduced version of `mpg`, with six
random observations and a smaller set of columns. Note that we use the
dplyr function `sample_n()` to generate a sample from `mpg`, from two
classes, “compact” and “midsize”.

``` r
set.seed(100)
mpg_m <- mpg %>%
         dplyr::filter(class %in% c("compact","midsize")) %>%
         dplyr::select(manufacturer:year,cty,class) %>%
         dplyr::sample_n(6)
mpg_m
```

    ## # A tibble: 6 × 6
    ##   manufacturer model  displ  year   cty class  
    ##   <chr>        <chr>  <dbl> <int> <int> <chr>  
    ## 1 volkswagen   jetta    2    1999    21 compact
    ## 2 volkswagen   jetta    2.5  2008    21 compact
    ## 3 chevrolet    malibu   3.6  2008    17 midsize
    ## 4 volkswagen   gti      2    2008    21 compact
    ## 5 audi         a4       2    2008    21 compact
    ## 6 toyota       camry    3.5  2008    19 midsize

A vector of size 1 is added, and this is recycled to the correct length.

``` r
mpg_m %>% dplyr::mutate(Test="A test")
```

    ## # A tibble: 6 × 7
    ##   manufacturer model  displ  year   cty class   Test  
    ##   <chr>        <chr>  <dbl> <int> <int> <chr>   <chr> 
    ## 1 volkswagen   jetta    2    1999    21 compact A test
    ## 2 volkswagen   jetta    2.5  2008    21 compact A test
    ## 3 chevrolet    malibu   3.6  2008    17 midsize A test
    ## 4 volkswagen   gti      2    2008    21 compact A test
    ## 5 audi         a4       2    2008    21 compact A test
    ## 6 toyota       camry    3.5  2008    19 midsize A test

A vector of the same length is added, and this vector is based on an
existing column.

``` r
mpg_m %>% dplyr::mutate(cty_kmh=cty*1.6,
                        cty_2=cty_kmh/1.6)
```

    ## # A tibble: 6 × 8
    ##   manufacturer model  displ  year   cty class   cty_kmh cty_2
    ##   <chr>        <chr>  <dbl> <int> <int> <chr>     <dbl> <dbl>
    ## 1 volkswagen   jetta    2    1999    21 compact    33.6    21
    ## 2 volkswagen   jetta    2.5  2008    21 compact    33.6    21
    ## 3 chevrolet    malibu   3.6  2008    17 midsize    27.2    17
    ## 4 volkswagen   gti      2    2008    21 compact    33.6    21
    ## 5 audi         a4       2    2008    21 compact    33.6    21
    ## 6 toyota       camry    3.5  2008    19 midsize    30.4    19

### Summarizing observations with summarize()

The function `summarize()` creates a new tibble. It will have one (or
more) rows for each combination of grouping variable.

``` r
mpg %>% 
  dplyr::summarize(CtyAvr=mean(cty),
                   CtySD=sd(cty),
                   HwyAvr=mean(hwy),
                   HwySD=sd(hwy))
```

    ## # A tibble: 1 × 4
    ##   CtyAvr CtySD HwyAvr HwySD
    ##    <dbl> <dbl>  <dbl> <dbl>
    ## 1   16.9  4.26   23.4  5.95

You can group by a variable, or a set of variables. This allows for
summaries by group, which is very useful.

``` r
mpg %>% 
  dplyr::group_by(class) %>%
  dplyr::summarize(CtyAvr=mean(cty),
                   CtySD=sd(cty),
                   HwyAvr=mean(hwy),
                   HwySD=sd(hwy),
                   N=dplyr::n()) %>%
  ungroup()
```

    ## # A tibble: 7 × 6
    ##   class      CtyAvr CtySD HwyAvr HwySD     N
    ##   <chr>       <dbl> <dbl>  <dbl> <dbl> <int>
    ## 1 2seater      15.4 0.548   24.8  1.30     5
    ## 2 compact      20.1 3.39    28.3  3.78    47
    ## 3 midsize      18.8 1.95    27.3  2.14    41
    ## 4 minivan      15.8 1.83    22.4  2.06    11
    ## 5 pickup       13   2.05    16.9  2.27    33
    ## 6 subcompact   20.4 4.60    28.1  5.38    35
    ## 7 suv          13.5 2.42    18.1  2.98    62
