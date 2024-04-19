Chapter 9 Examples - Relational Data with dplyr and Tidying Data with
tidyr
================

### Relational data

A relational model organizes data into one or more tables of columns and
rows, where a unique key identifies each row. A key can be a single
column value, known as a primary key, for example, a unique identifier
for a person. For example, for the tibble `aimsir17::stations`, the
primary key is the variable `station`, as this value is unique for each
row, and therefore can be used to identify a single observation.

``` r
library(aimsir17)
library(dplyr)

stations %>% dplyr::filter(station=="MACE HEAD")
```

    ## # A tibble: 1 × 5
    ##   station   county height latitude longitude
    ##   <chr>     <chr>   <dbl>    <dbl>     <dbl>
    ## 1 MACE HEAD Galway     21     53.3     -9.90

We will now provide a simple example, which will be used to show how two
tables can be linked together via a foreign key. The idea here is that
we can represent two important ideas from a company’s information
system, namely *products* and *orders*, in two separate, but related,
tables.

``` r
products <- tibble(ProductID=c("PR-1","PR-2","PR-3","PR-9"),
                   Type=c("Computer","Tablet","Phone","Headphones"))
products
```

    ## # A tibble: 4 × 2
    ##   ProductID Type      
    ##   <chr>     <chr>     
    ## 1 PR-1      Computer  
    ## 2 PR-2      Tablet    
    ## 3 PR-3      Phone     
    ## 4 PR-9      Headphones

``` r
dplyr::filter(products,ProductID=="PR-9")
```

    ## # A tibble: 1 × 2
    ##   ProductID Type      
    ##   <chr>     <chr>     
    ## 1 PR-9      Headphones

``` r
orders <- tibble(OrderID=c("OR-1","OR-2","OR-3","OR-4","OR-5"),
                 Quantity=c(1,2,1,2,3),
                 ProductID=c("PR-1","PR-2","PR-3","PR-4","PR-1"))
orders
```

    ## # A tibble: 5 × 3
    ##   OrderID Quantity ProductID
    ##   <chr>      <dbl> <chr>    
    ## 1 OR-1           1 PR-1     
    ## 2 OR-2           2 PR-2     
    ## 3 OR-3           1 PR-3     
    ## 4 OR-4           2 PR-4     
    ## 5 OR-5           3 PR-1

``` r
dplyr::filter(orders,OrderID=="OR-5")
```

    ## # A tibble: 1 × 3
    ##   OrderID Quantity ProductID
    ##   <chr>      <dbl> <chr>    
    ## 1 OR-5           3 PR-1

### Mutating joins

The `inner_join()` function joins observations that appear in both
tables, based on a common key, which need to be present in both tables.

``` r
i_j <- dplyr::inner_join(orders,products,by="ProductID")
i_j
```

    ## # A tibble: 4 × 4
    ##   OrderID Quantity ProductID Type    
    ##   <chr>      <dbl> <chr>     <chr>   
    ## 1 OR-1           1 PR-1      Computer
    ## 2 OR-2           2 PR-2      Tablet  
    ## 3 OR-3           1 PR-3      Phone   
    ## 4 OR-5           3 PR-1      Computer

A left join will keep all observations in the tibble `x`, even if there
is no match in tibble `y`. This is a widely used function, given that it
maintains all the observations in `x`.

``` r
l_j1 <- dplyr::left_join(orders,products,by="ProductID")
l_j1
```

    ## # A tibble: 5 × 4
    ##   OrderID Quantity ProductID Type    
    ##   <chr>      <dbl> <chr>     <chr>   
    ## 1 OR-1           1 PR-1      Computer
    ## 2 OR-2           2 PR-2      Tablet  
    ## 3 OR-3           1 PR-3      Phone   
    ## 4 OR-4           2 PR-4      <NA>    
    ## 5 OR-5           3 PR-1      Computer

A right join keeps all observations in the tibble y. In this example, we
can see that all the product information is shown (there are five
products in all), but that the order “OR-4” is missing, as that is for
“PR-4”, which is not present in the `products` table.

``` r
r_j1 <- dplyr::right_join(orders,products,by="ProductID")
r_j1
```

    ## # A tibble: 5 × 4
    ##   OrderID Quantity ProductID Type      
    ##   <chr>      <dbl> <chr>     <chr>     
    ## 1 OR-1           1 PR-1      Computer  
    ## 2 OR-2           2 PR-2      Tablet    
    ## 3 OR-3           1 PR-3      Phone     
    ## 4 OR-5           3 PR-1      Computer  
    ## 5 <NA>          NA PR-9      Headphones

A full join keeps all observations in both x and y. The same overall
result is obtained regardless of which tibble is the first one. For
example, here is a full join of products and orders.

``` r
f_j1 <- dplyr::full_join(products,orders,by="ProductID")
f_j1
```

    ## # A tibble: 6 × 4
    ##   ProductID Type       OrderID Quantity
    ##   <chr>     <chr>      <chr>      <dbl>
    ## 1 PR-1      Computer   OR-1           1
    ## 2 PR-1      Computer   OR-5           3
    ## 3 PR-2      Tablet     OR-2           2
    ## 4 PR-3      Phone      OR-3           1
    ## 5 PR-9      Headphones <NA>          NA
    ## 6 PR-4      <NA>       OR-4           2

### Filtering joins

The function `semi_join()` will keep all the observations in x that have
a matching column in y. In our manufacturing example, we can perform
this join based on the `ProductID`, starting with the orders table.

``` r
s_j1 <- dplyr::semi_join(orders,products,by="ProductID")
s_j1
```

    ## # A tibble: 4 × 3
    ##   OrderID Quantity ProductID
    ##   <chr>      <dbl> <chr>    
    ## 1 OR-1           1 PR-1     
    ## 2 OR-2           2 PR-2     
    ## 3 OR-3           1 PR-3     
    ## 4 OR-5           3 PR-1

The filtering function `anti_join()` will keep all the observations in x
that do have a matching column in y. Again, this is a filtering join,
and therefore only observations from the first tibble are returned. The
function can be applied to our example, and yields the following
results.

``` r
a_j1 <- dplyr::anti_join(orders,products,by="ProductID")
a_j1
```

    ## # A tibble: 1 × 3
    ##   OrderID Quantity ProductID
    ##   <chr>      <dbl> <chr>    
    ## 1 OR-4           2 PR-4

### Tidy data

This is an example of untidy data, where every row is not one
observation, and columns are not variables.

We will now re-create the untidy data in R using atomic vectors and the
`tibble()` function. We include the library `tidyr`, as this contains
functions to transform the data to tidy format.

``` r
library(dplyr)
library(tidyr)
set.seed(100)
N = 2

res <- tibble(ID=paste0("ID",1:N),
              CX101=sample(30:70,N),
              CX102=sample(40:80,N),
              CX103=sample(60:70,N))
res
```

    ## # A tibble: 2 × 4
    ##   ID    CX101 CX102 CX103
    ##   <chr> <int> <int> <int>
    ## 1 ID1      39    64    66
    ## 2 ID2      67    53    65

Using `pivot_longer()`, we can now convert the tibble to a longer
format.

``` r
res_l <- tidyr::pivot_longer(res,
                             `CX101`:`CX103`,
                             names_to="Subject",
                             values_to="Grade")

res_l
```

    ## # A tibble: 6 × 3
    ##   ID    Subject Grade
    ##   <chr> <chr>   <int>
    ## 1 ID1   CX101      39
    ## 2 ID1   CX102      64
    ## 3 ID1   CX103      66
    ## 4 ID2   CX101      67
    ## 5 ID2   CX102      53
    ## 6 ID2   CX103      65
