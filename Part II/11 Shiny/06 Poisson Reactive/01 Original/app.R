library(shiny)
library(aimsir17)
library(dplyr)
library(ggplot2)
library(glue)

ui <- fluidPage(
  message("Starting the UI..."),
  titlePanel("Showing Reactive functions"),
  fluidRow(
  column(3,
         "Poisson 1",
         numericInput("lambda1",label="Lambda1",value=50,min=1)),
  column(3,
         "Poisson 2",
         numericInput("lambda2",label="Lambda2",value=50,min=1)),
  column(3,
         "Total Samples",
         numericInput("N",label="N",value=500,min=100)),
  column(3,
         "Binwidth",
         numericInput("BW",label="N",value=2,min=1))),
  fluidRow(column(12,plotOutput("plot")))
)

server <- function(input, output, session){
  message("\nStarting the server...")
  output$plot <- renderPlot({
    message(glue("In output$graph >> {input$lambda1}-{input$lambda2}-{input$N}"))
     d1 <- tibble(Distribution=rep("Poisson One",input$N),
                 Value=rpois(input$N,input$lambda1))
     d2 <- tibble(Distribution=rep("Poisson Two",input$N),
                  Value=rpois(input$N,input$lambda2))
     d3 <- bind_rows(d1, d2)
     ggplot(d3,aes(x=Value))+
       geom_histogram(binwidth = input$BW)+
       facet_wrap(~Distribution,nrow = 1,scales = "free")
  })
  
}

shinyApp(ui, server)
