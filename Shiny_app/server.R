library(shiny)

# source for the server

source("./server/server_eins.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <-  renderPlot({
    max <- LIST_OF_TABLE$Shots[fidShooters == input$shooter]

        p <- ggplot(data = max) +
      geom_point(aes(0,0, color = "red"), size = 10) +
      geom_point(aes(x = x_co, y = y_co)) +
      geom_density2d(aes(x = x_co, y = y_co)) +
      theme_bw()
    
    p
    
  })
  
})
