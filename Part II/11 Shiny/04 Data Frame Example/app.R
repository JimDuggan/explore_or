library(shiny)
library(aimsir17)
library(dplyr)
library(ggplot2)
library(glue)
library(tidyr)

stations6 <- observations %>%
  select(station) %>%
  pull() %>%
  unique() %>%
  head()

ui <- fluidPage(
  message("\nStarting the UI..."),
  titlePanel("Summarising Monthly Rainfall"),
  selectInput("station1", label="Weather Station 1", choices=stations6),
  selectInput("station2", label="Weather Station 2", choices=stations6),
  tableOutput("monthly")
)

server <- function(input, output, session){
  
  message("\nStarting the server...")
  

  output$monthly <- renderTable({
    message(glue("output$table>>  with station1 = {input$station1}\n"))
    message(glue("output$table>>  with station2 = {input$station2}\n"))
    dataset <- filter(observations, station %in% c(input$station1,
                                                   input$station2)) 
    s_rain <- dataset %>%
                group_by(station, month) %>%
                summarise(TotalRain=sum(rain,na.rm = T)) %>%
                pivot_wider(names_from = "month", values_from="TotalRain")
                
    s_rain
  })
}

shinyApp(ui, server)
