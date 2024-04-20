library(shiny)

ui <- fluidPage(
  message("Starting the UI..."),
  "Hello, Shiny!"
)

server <- function(input, output, session){
  message("\nStarting the server...\n")
}

shinyApp(ui, server)
