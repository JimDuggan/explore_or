library(aimsir17)

# mh <- subset(observations,station=="MACE HEAD")

# Find all rain missing values and store in a data frame.

mvr <- subset(observations,is.na(rain))
mvr2 <- observations[is.na(observations$rain),]

# find the stations with non-performing rain sensors

unique(mvr$station)

target <- c("BALLYHAISE",    
            "CLAREMORRIS",   
            "GURTEEN")

n_df <- subset(observations,station %in% target)

sum(complete.cases(n_df))
sum(!complete.cases(n_df))

incom <- n_df[!complete.cases(n_df),]




unique(observations[!complete.cases(observations),]$station)