# Chapter 9: Relational Data with dplyr and Tidying Data with tidyr

# Load libraries
library(aimsir17)
library(dplyr)


# Show an example of a primary key (station)
stations %>% dplyr::filter(station=="MACE HEAD")

# Create some sample data, a products table

products <- tibble(ProductID=c("PR-1","PR-2","PR-3","PR-9"),
                   Type=c("Computer","Tablet","Phone","Headphones"))
products

dplyr::filter(products,ProductID=="PR-9")


# Create some sample data, an orders table
orders <- tibble(OrderID=c("OR-1","OR-2","OR-3","OR-4","OR-5"),
                 Quantity=c(1,2,1,2,3),
                 ProductID=c("PR-1","PR-2","PR-3","PR-4","PR-1"))
orders

dplyr::filter(orders,OrderID=="OR-5")

# Now we show some mutating joins
i_j <- dplyr::inner_join(orders,products,by="ProductID")
i_j

l_j1 <- dplyr::left_join(orders,products,by="ProductID")
l_j1

r_j1 <- dplyr::right_join(orders,products,by="ProductID")
r_j1


f_j1 <- dplyr::full_join(products,orders,by="ProductID")
f_j1


# Here are filtering joins

s_j1 <- dplyr::semi_join(orders,products,by="ProductID")
s_j1


a_j1 <- dplyr::anti_join(orders,products,by="ProductID")
a_j1


# Here is an example of untidy data
library(dplyr)
library(tidyr)
set.seed(100)
N = 2

res <- tibble(ID=paste0("ID",1:N),
              CX101=sample(30:70,N),
              CX102=sample(40:80,N),
              CX103=sample(60:70,N))
res

# Using `pivot_longer()`, we can now convert the tibble to a longer (tidy) format.

res_l <- tidyr::pivot_longer(res,
                             `CX101`:`CX103`,
                             names_to="Subject",
                             values_to="Grade")

res_l

