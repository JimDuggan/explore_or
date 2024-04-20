library(shiny)
library(aimsir17)
library(dplyr)
library(ggplot2)
library(glue)

stations6 <- observations %>%
  select(station) %>%
  pull() %>%
  unique() %>%
  head()

ui <- fluidPage(
  message("\nStarting the UI..."),
  titlePanel("Exploring Weather Stations"),
  selectInput("station", label="Weather Stations", choices=stations6),
  verbatimTextOutput("summary")
)

server <- function(input, output, session){
  
  message("\nStarting the server...")
  
  output$summary <- renderPrint({
    message(glue("output$summary>> with input$station = {input$station}"))
    dataset <- filter(observations, station == input$station) %>%
                 select(rain,temp,rhum,msl,wdsp,wddir)
    cat("Summary Output for ",input$station,"\n\n")
    summary(dataset)
  })
  
}

shinyApp(ui, server)
