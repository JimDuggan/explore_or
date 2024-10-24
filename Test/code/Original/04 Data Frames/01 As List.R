# Explore how a data frame can be converted to a list (mtcars)
# Use sample to create a set of atomic vectors (size 20) with
# Student IDs (1000-9999) range
# Subject code (CT1111 or CT1112), 30% 70% probability
# Result (uniform between 55-95)
# Combine these into a data frame called results
# Explore the variable using str()

l <- as.list(mtcars)

set.seed(100)
student_ids <- sample(1000:9999,20)
subjects    <- sample(c("CT1111","CT1112"),20,prob = c(.3,.7),replace = T)

table(subjects)
prop.table(table(subjects))

results <- sample(55:95,20,replace = T)

res_df <- data.frame(Student_ID=student_ids,
                     Subject=subjects,
                     Grade=results)


