library(shiny)
library(aimsir17)
library(ggplot2)
library(glue)

vars<- mpg %>%
       select(-year) %>%
       select(where(is.numeric)) %>%
       colnames()

ui <- fluidPage(
  titlePanel("Exploring variables in the dataset mpg"),
  fluidRow(
    column(2,selectInput("x_var", label="X Variable", choices=vars)),
    column(2,selectInput("y_var", label="Y Variable", choices=vars)),
    column(5,checkboxInput("cb_smooth","Show Linear Model",value = TRUE))
  ),
  plotOutput("plot")
)

server <- function(input, output, session){
  message("\nStarting the server...")
  output$plot <- renderPlot({
    x_var <- input$x_var
    y_var <- input$y_var
    message(glue("Smooth = {input$cb_smooth} \n"))
    p1 <- ggplot(mpg,aes_string(x=x_var,y=y_var))+
            geom_point()
    if(input$cb_smooth == TRUE)
      p1 <- p1 + geom_smooth(method="lm")
    p1
  })
  
}

shinyApp(ui, server)
