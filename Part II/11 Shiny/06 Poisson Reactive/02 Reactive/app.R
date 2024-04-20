library(shiny)
library(ggplot2)
library(glue)
library(dplyr)


ui <- fluidPage(
  message("Starting the UI..."),
  titlePanel("Adding reactive expressions"),
  fluidRow(
  column(3,
         "Poisson One",
         numericInput("lambda1",label="Lambda1",value=50,min=1)),
  column(3,
         "Poisson Two",
         numericInput("lambda2",label="Lambda2",value=100,min=1)),
  column(3,
         "Total Samples",
         numericInput("N",label="N",value=1000,min=100)),
  column(3,
         "Binwidth",
         numericInput("BW",label="W",value=3,min=1))),
  fluidRow(column(12,plotOutput("plot")))
)

server <- function(input, output, session){
  message("\nStarting the server...")
  
  generate1 <- reactive({
                   message("Calling generate1()...")
                   tibble(Distribution=rep("Poisson One",input$N),
                               Value=rpois(input$N,input$lambda1))})
  
  generate2 <- reactive({
    message("Calling generate2()...")
    tibble(Distribution=rep("Poisson Two",input$N),
           Value=rpois(input$N,input$lambda2))})
  
  
  output$plot <- renderPlot({
    message(glue("In output$graph >> {input$lambda1}-{input$lambda2}-{input$N}"))
     d1 <- generate1()
     d2 <- generate2()
     d3 <- bind_rows(d1, d2)
     ggplot(d3,aes(x=Value))+
       geom_histogram(binwidth = input$BW)+
       facet_wrap(~Distribution,nrow = 1,scales = "free")
  })
  
}

shinyApp(ui, server)
