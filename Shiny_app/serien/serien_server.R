# ------------ PLOT SERIEN OVER TIME ----------
mod_server_serien <- function(input, output, session, all_shot_table){
  
  # ------------PLOT SERIEN OVER TIME -----------
  output$serien_over_time <- renderPlotly({
    
        serien <- get_series(all_shot_table())[
      ,':='(mean_dec = mean(ergebnis_dec),
            mean_full = mean(ergebnis_full)),
      by = day]
    
    p <- ggplot(data = serien)+
      geom_point(aes(x = day, y = mean_full),
                 color = "red", size = 3)+
      geom_point(aes(x = day, y = ergebnis_full))+
      geom_smooth(aes(x = day, y = ergebnis_full),
                  method ='lm',formula=y~x, se = F)+
          theme_bw()
    
    ggplotly(p)
    
  })
  # Plot Shots in a serie
  output$shots_in_serie <- renderPlotly({
    table_data <- all_shot_table()[, ':='(schuss = schuss)
                                   ][, mittel_y := median(dec), by = schuss]
    p <- ggplot(data = table_data)+
      geom_point(aes(x = schuss, y = dec))+
      geom_point(aes(x = schuss, y = mittel_y, colour = "red"))+
      geom_hline(yintercept = median(table_data[,unique(mittel_y)]))
    ggplotly(p)
  })
  return()
}