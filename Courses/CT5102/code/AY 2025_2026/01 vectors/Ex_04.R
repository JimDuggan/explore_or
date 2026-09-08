# Set the seed
set.seed(99)

# Generate the data
temp <- sample(-5:30,20,replace = T)

# Use vectorised ifelse to generate new
# descriptive data on temperatures
temp_des <- ifelse(temp<4,
                   "Cold",
                   ifelse(temp>25,"Hot",
                          "Medium"))

# Which observations were cold?

which(temp_des == "Cold")

which(temp < 4)

