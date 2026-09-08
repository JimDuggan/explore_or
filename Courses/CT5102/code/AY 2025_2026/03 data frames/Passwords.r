# A password generator example
LEN <- 20

pwd <- sample(c(LETTERS,letters,0:9),LEN, replace = TRUE)

pwd <- paste0(sample(c(LETTERS,letters,0:9),10, replace = TRUE),
              collapse = "")

N <- 100



pwd_all <- 1:N |>
            lapply(function(x)
                     paste0(sample(c(LETTERS,letters,0:9),LEN, 
                                   replace = TRUE),
                            collapse = "")
                   ) |>
            unlist()
