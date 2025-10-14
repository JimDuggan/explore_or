# A password generator example

pwd <- sample(c(LETTERS,letters,0:9),10)

pwd <- paste0(sample(c(LETTERS,letters,0:9),10),collapse = "")

N <- 100

LEN <- 20

pwd_all <- 1:N |>
            lapply(function(x)paste0(sample(c(LETTERS,letters,0:9),LEN),collapse = "")) |>
            unlist()
