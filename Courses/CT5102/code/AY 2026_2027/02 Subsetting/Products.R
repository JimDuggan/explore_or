# A small products database. Main list has two products
products <- list(A=list(product="A",
                        sales=12000,
                        quarterly=list(quarter=1:4,
                                       sales=c(6000,3000,2000,1000))),
                 B=list(product="B",
                        sales=8000,
                        quarterly=list(quarter=1:4,
                                       sales=c(2500,1500,2800,1200))))
str(products)