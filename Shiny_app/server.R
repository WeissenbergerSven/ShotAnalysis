library(shiny)

# source for the server

source("./server/server_eins.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # plot all shots from in a given time period 
  output$all_shots <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == input$shooter &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    
    p <- ggplot(data = all_shot_table) +
      geom_point(aes(0,0, color = "red"), size = 10) +
      geom_point(aes(x = x_co, y = y_co)) +
      geom_density2d(aes(x = x_co, y = y_co)) +
      coord_cartesian(xlim = c(-1000, 1000), ylim = c(-1000, 1000)) +
      theme_bw()
    p
  })
  
  # plot the x variance
  output$x_variance <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == input$shooter &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    p <- ggplot(all_shot_table) +
      stat_density(aes(x = x_co, y = ..scaled..)) +
      geom_vline(xintercept = 0) +
     coord_cartesian(xlim = c(-1000, 1000)) +
           theme_bw()
      
    p
  })
  # plot the y variance
  output$y_variance <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == input$shooter &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    p <- ggplot(all_shot_table) +
      stat_density(aes(x = y_co, y = ..scaled..)) +
      geom_vline(xintercept = 0) +
      theme_bw() +
    coord_cartesian(xlim = c(-1000, 1000))
  
      
    p
  })
})
