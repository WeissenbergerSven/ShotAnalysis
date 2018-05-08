# ------------ PLOT ALL SHOT OVERVIEW ----------
mod_server_overview_table <- function(input, output, session, all_shot_table){
  
  #Plot dataTable
  output$mytable = renderDataTable({
    # Create series for every shooter
    comparetable <- data.table()
    for(i in name_selector){
      comparetable <- get_series(
        LIST_OF_TABLE$Shots[fidShooters == i])[
          ,fidShooters := i] %>% 
        rbind(comparetable)
    }
    comparetable[,zweiers := (series-(series+1)%%2), by = .(day, fidShooters)
                 ][,.(series_zwei = sum(ergebnis_full)), by = .(zweiers, day, fidShooters)
                   ][,]
    comparetable %>% unique()
  })
  
  return()
}