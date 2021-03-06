# ------------ PLOT ALL SHOT OVERVIEW ----------
mod_server_all_shots <- function(input, output, session, all_shot_table){
  
  # ------------PLOT ALL SHOTS -----------
  output$all_shots <- renderPlotly({
    
    # Colours for the points
    COLOURS <- c("0" = "black", "1" = "green", "2" = "green", "3"= "green",
                 "4" = "green", "5"= "green", "6" = "skyblue", "7" = "blue",
                 "8" = "green", "9" = "yellow", "10" = "red")
    
    p <- ggplot(data = all_shot_table())+
      geom_point(aes(x = x_co, y = y_co,
                     datum = day,
                     color = as.factor(full)))+
      scale_color_manual(values = COLOURS, name = "Ringe")+
      geom_density2d(aes(x = x_co, y = y_co))+
      geom_vline(xintercept = 0)+
      geom_hline(yintercept = 0)+
      coord_cartesian(xlim = c(-1000, 1000), ylim = c(-1000, 1000))+
      theme_bw()+
      labs(title = "Sämtliche Schüsse", x = "X", y = "Y")+
      annotate("path", x = 0+1*cos(seq(0,2*pi,length.out = 100)),
               y = 0,1*sin(seq(0,2*pi,length.out = 100)))
    ggplotly(p)
  })
  # --------------PLOT THE X VARIANCE------------
  output$x_variance <- renderPlotly({
    
    p <- ggplot(all_shot_table(), aes(x = x_co, y = ..scaled..))+
      stat_density(aes(x = -x_co, y = ..scaled..), fill = "blue")+
      stat_density(aes(x = x_co, y = ..scaled..))+
      geom_vline(xintercept = 0)+
      coord_cartesian(xlim = c(-1000, 1000))+
      theme_bw()
    ggplotly(p)
  })
  # ---------PLOT THE Y VARIANCE ------------
  output$y_variance <- renderPlotly({
    
    p <- ggplot(all_shot_table())+
      stat_density(aes(x = -y_co, y = ..scaled..), fill = "blue")+
      stat_density(aes(x = y_co, y = ..scaled..))+
      geom_vline(xintercept = 0)+
      coord_cartesian(xlim = c(-1000, 1000))+
      theme_bw()
    
    ggplotly(p)
  })
  return()
}