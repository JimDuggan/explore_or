# for (x in xs)
# for (i in seq_along(xs))
# for (nm in names(xs))

x <- 1:10
names(x) <- letters[11:20]
x[7]<- 99
# Loop method 1
for (i in x){
  print(i)
}

# Loop method 2
for (i in seq_along(x)){
  cat("Index = ",i, "Value = ",x[i],"Name = ",names(x)[i],"\n")
}

# Loop method 3
for (i in names(x)){
  print(i)
}

# Loop method 4
for (i in 1:length(x)){
  print(i)
}

for (i in 1:length(x)){
  cat("Index = ",i, "Value = ",x[i],"Name = ",names(x)[i],"\n")
}









