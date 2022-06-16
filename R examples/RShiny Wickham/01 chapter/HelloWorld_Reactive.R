library(shiny)
library(aimsir17)
library(dplyr)
library(ggplot2)

ui <- fluidPage(
  "Hello, world!",
  selectInput("dataset1",label="Choose Station 1",choices = unique(pull(observations,station))),
  selectInput("dataset2",label="Choose Station 2",choices = unique(pull(observations,station))),
  sliderInput("month", "Select Month:",min = 1, max = 12, value = 6),
  plotOutput("graph1"),
  tableOutput("table1"),
  tableOutput("table2")
)

server <- function(input, output, session){
  message("Running server...")

  
  output$table1 <- renderTable({
    tab <- observations %>%
            filter(station==input$dataset1) %>%
            filter(month==as.numeric(input$month)) %>%
            select(-date) %>%
            head()
    tab
  })
  
  output$graph1 <- renderPlot({
    tab1 <- observations %>%
      filter(station==input$dataset1) %>%
      filter(month==as.numeric(input$month)) 
    tab2 <- observations %>%
      filter(station==input$dataset2) %>%
      filter(month==as.numeric(input$month)) 
    ggplot()+
          geom_point(data=tab1, mapping=aes(x=date,y=temp),colour="blue")+
          geom_line(data=tab1, mapping=aes(x=date,y=temp),colour="blue")+
          geom_point(tab2, mapping=aes(x=date,y=temp),colour="red")+
          geom_line(data=tab2, mapping=aes(x=date,y=temp),colour="red")+
          ggtitle(paste0("Rainfall. Blue=",input$dataset1," Red = ",input$dataset2))
  })
  
  output$table2 <- renderTable({
    tab <- observations %>%
      filter(station==input$dataset2) %>%
      filter(month==as.numeric(input$month)) %>%
      select(-date) %>%
      head()
    tab
  })

}

shinyApp(ui, server)