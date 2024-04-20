library(shiny)
library(glue)

ui <- fluidPage(
  numericInput("input_num","Enter Number",10),
  textOutput("msg")
)

server <- function(input, output, session){
  output$msg<- renderText({
    message(glue("Input is {input$input_num}"))
    ans <- input$input_num^2
    glue("The square of {input$input_num} is {ans}\n")
  })
}

shinyApp(ui, server)

