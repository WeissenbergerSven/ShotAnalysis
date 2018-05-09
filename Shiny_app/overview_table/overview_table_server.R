# ------------ PLOT ALL SHOT OVERVIEW ----------
mod_server_overview_table <- function(input, output, session){
  # Anzahl der Serien in der Werung
  NUMBER_COUNTED_SERIEN <- 10
  # Ausgeschlossene Namen
  NAMES_TO_EXCLUDE <- c("RWK-Gegner", "Lichtpunkt", "Trainingsschütze")
  # Name zu id zuordner
  NAMES_TO_ID <- data.table(names = names(name_selector), fidShooters = name_selector)
  
  
  output$mytable = renderDataTable({
    # Create series for every shooter
    series_for_player <- data.table()
    for(i in name_selector){
      series_for_player <- get_series(
        LIST_OF_TABLE$Shots[fidShooters == i])[
          ,fidShooters := i] %>% 
        rbind(series_for_player)
    }
    # Find the top 10 20er Serien
    top_series <- series_for_player[
      ,series_combine_number := (series-(series+1)%%2), 
      by = .(day, fidShooters)
      ][,.(two_series_combined = sum(ergebnis_full)), 
        by = .(series_combine_number, day, fidShooters)
        ][order(fidShooters, -two_series_combined)
          ][,head(.SD, NUMBER_COUNTED_SERIEN), by = .(fidShooters)
            ][, ':='(series_combine_number = NULL, day = NULL)] %>% 
      unique()
    top_series <- top_series[,Seq := seq(.N), by = fidShooters
                             ][, Seq := paste0("Serie", Seq)] %>% 
      spread(Seq, two_series_combined, fill = 0)
    top_series <- top_series[,lapply(.SD, mean), by = .(fidShooters)
                             ][,':='(series_gesammt = Serie1+Serie2+
                                       Serie3+Serie4+Serie5+Serie6+
                                       Serie7+Serie8+Serie9+Serie10),
                               by = fidShooters]
    top_series <- NAMES_TO_ID[top_series, on = .(fidShooters)
                              ][order(-series_gesammt)
                                ][,fidShooters := NULL]
    for(i in NAMES_TO_EXCLUDE){
      top_series<- top_series[!names %like% i]
    }
    top_series <- setcolorder(top_series, c(1,12,2, 4:11,3))
  })
  
  return()
}