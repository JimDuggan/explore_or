library(dplyr)
library(aimsir17)
library(ggplot2)

# Create the tibbles

products <- tibble(ProductID=c("PR-1","PR-2","PR-3","PR-9"), 
                   Type=c("Computer","Tablet","Phone","Headphones")) 

products

filter(products,ProductID=="PR-9")

orders <- tibble(OrderID=c("OR-1","OR-2","OR-3","OR-4","OR-5"), 
                 Quantity=c(1,2,1,2,3), 
                 ProductID=c("PR-1","PR-2","PR-3","PR-4","PR-1")) 

orders

filter(orders,OrderID=="OR-5")

# Mutating join

# inner_join()

i_j <- inner_join(orders,products,by="ProductID") 
i_j

# left_join()
l_j1 <- left_join(orders,products,by="ProductID") 
l_j1


l_j2 <- left_join(orders,products,by="ProductID",keep=TRUE) 
l_j2

l_j3 <- left_join(products,orders,by="ProductID") 
l_j3

# full_join()
f_j1 <- full_join(products,orders,by="ProductID") 
f_j1


# Filtering joins

# semi_join()
s_j1 <- semi_join(orders,products,by="ProductID") 
s_j1

s_j2 <- semi_join(products,orders,by="ProductID") 
s_j2

# anti_join()

a_j1 <- anti_join(orders,products,by="ProductID") 
a_j1

a_j2 <- anti_join(products,orders,by="ProductID") 
a_j2


# Mini-case... joining weather and energy data.

