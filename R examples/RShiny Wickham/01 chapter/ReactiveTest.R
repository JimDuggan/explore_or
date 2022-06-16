library(shiny)
reactiveConsole(TRUE)

temp_c <- reactiveVal(100)


temp_f <- reactive({
  message("Converting")
  (temp_c()*9/5)+32
})

temp_c(20)