# ------------ PLOT SERIEN OVER TIME ----------
mod_server_serien <- function(input, output, session, name){
  # ------------PLOT SERIEN OVER TIME -----------
  output$serien_over_time <- renderPlot({
    all_shot_table <- LIST_OF_TABLE$Shots[fidShooters == name() &
                                            as.Date(shottimestamp) >= input$all_date[1]  &
                                            as.Date(shottimestamp) <= input$all_date[2]]
    
    serien <- get_series(all_shot_table)[
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
p
  })
  
  return()
}