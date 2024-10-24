# Create a new column called “Model”, which contains the 
# type of car. How is the model information currently stored?

car_names <- rownames(mtcars)

mtcars$Model <- car_names

l <- mtcars$mpg > mean(mtcars$mpg)

