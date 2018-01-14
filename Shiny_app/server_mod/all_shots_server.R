# ------------ PLOT ALL SHOT OVERVIEW ----------
mod_server_all_shots <- function(input, output, session){
  # ------------PLOT ALL SHOTS -----------
  output$all_shots <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == input$shooter &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    ggplot(data = all_shot_table) +
      geom_point(aes(0,0, color = "red"), size = 10) +
      geom_point(aes(x = x_co, y = y_co)) +
      geom_density2d(aes(x = x_co, y = y_co)) +
      coord_cartesian(xlim = c(-1000, 1000), ylim = c(-1000, 1000)) +
      theme_bw()
  })
  # --------------PLOT THE X VARIANCE------------
  output$x_variance <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == input$shooter &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    ggplot(all_shot_table) +
      stat_density(aes(x = x_co, y = ..scaled..)) +
      geom_vline(xintercept = 0) +
      coord_cartesian(xlim = c(-1000, 1000)) +
      theme_bw()
  })
  # ---------PLOT THE Y VARIANCE ------------
  output$y_variance <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == input$shooter &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    ggplot(all_shot_table) +
      stat_density(aes(x = y_co, y = ..scaled..)) +
      geom_vline(xintercept = 0) +
      theme_bw() +
      coord_cartesian(xlim = c(-1000, 1000))
  })
  return()
}