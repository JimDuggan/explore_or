# List all the cars that have an mpg greater than the average

avr <- mean(mtcars$mpg)

b <- mtcars$mpg > avr
mtcars[b,]

mtcars[mtcars[,"mpg"]>avr,]

mtcars[mtcars$mpg > avr,]

subset(mtcars,mpg > avr,1)

# List the car(s) with the greatest displacement
max_d <- max(mtcars$disp)
b <- mtcars$disp == max_d
mtcars[b,]

which(b)
mtcars[which(b),]

mtcars[mtcars[,"disp"]==max_d,]
mtcars[mtcars$disp == max_d,]

subset(mtcars,disp == max_d)

subset(mtcars,disp == max(disp))

subset(mtcars,disp == min(disp))

subset(mtcars,disp == median(disp))



