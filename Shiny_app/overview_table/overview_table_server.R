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
    # Find the top 10 20er Serien
    a <- comparetable[,zweiers := (series-(series+1)%%2), by = .(day, fidShooters)
                 ][,.(series_zwei = sum(ergebnis_full)), by = .(zweiers, day, fidShooters)
                   ][order(fidShooters, -series_zwei)
                     ][,head(.SD, 10), by = .(fidShooters)
                       ][, ':='(zweiers = NULL, day = NULL)] %>% 
      unique()
    aa <- a[,Seq := seq(.N), by = fidShooters
            ][, Seq := paste0("Serie", Seq)]
    ab <- spread(aa, Seq, series_zwei, fill = 0)
    ac <- ab[,lapply(.SD, mean), by = .(fidShooters)]
  
    b <- ac[,':='(series_gesammt = Serie1+Serie2+Serie3+Serie4+Serie5+Serie6+Serie7+Serie8+Serie9+Serie10), by = fidShooters]
    help <- data.table(names = names(name_selector), fidShooters = name_selector)
    c <- help[b, on = .(fidShooters)
              ][order(-series_gesammt)
                ][,fidShooters := NULL]
d <- setcolorder(c, c(1,12,2, 4:11,3))
  })
  
  return()
}