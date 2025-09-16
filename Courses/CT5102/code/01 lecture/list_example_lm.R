# Here is an example to show how R uses list for 
# linear models

# generate the linear model, based on the dataset mtcars

mod <- lm(mpg~disp,data = mtcars)

# Show the returned list structure, 
# notice there are 12 list elements
# These all contain data relevant to the regression task
typeof(mod)
is.list(mod)

str(names(mod))
str(length(mod))
str(mod)