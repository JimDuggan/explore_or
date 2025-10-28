# Create a list that contains
# A vector of integers (1:10)
# A sequence of upper case letters (A-Z)
# A list with:
#   A vector of integers (11:20)
#   A sequence of lower case letters (A-Z)

l <- list(1:10,LETTERS[1:26],list(11:20,letters[1:26]))

# The first element as a vector
l[[1]][1]
# The second element as a vector
l[[2]]
# The third element as a list of a list
l[3]
# The third element as a list
l[[3]]
# The values 10, Q, 19 and the vector “w” ”x” “y”
l[[1]][10]
l[[2]][17]
l[[3]][[1]][9]
l[[3]][[2]][23:25]














# The first element as a vector
# The second element as a vector
# The third element as a list of a list
# The third element as a list
# The values 10, Q, 19 and the vector “w” ”x” “y”

str(l[[1]])
str(l[[2]])
str(l[3])
str(l[[3]])
l[[1]][10]
l[[2]][17]
l[[3]][[1]][9]
l[[3]][[2]][23:25]

l1 <- list(el1=1:10,el2=LETTERS[1:26],el3=list(el3_1=11:20,el3_2=letters[1:26]))
