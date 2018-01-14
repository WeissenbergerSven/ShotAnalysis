customPlot <- function(input, output, session){
  # plot all shots from in a given time period 
  output$plot <- renderPlot({
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
  return()
}