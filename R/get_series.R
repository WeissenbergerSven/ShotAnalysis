#' Get series of a Shooter
#' 
#' @param shoot_table data.table
#' @return data.table
#' @export
get_series <- function(shoot_table){
  # Check if right table
  if(!all(c("day", "dec", "full") %in% names(shoot_table))){
    stop("Wrong data.table.")
  }
  # Renumber the shoots because at some days there are multiple shot == 1
  table_all <- data.table()
  for(i in unique(shoot_table$day)){
    tab <- shoot_table[day == i]
    tab$schuss <- 1:nrow(tab)
    table_all <- rbind(table_all, tab)
  }
  # Get the seriesnumber
  table_all[, series := ceiling(schuss/10)]
  
  # Filter only the finished series
  table2 <- table_all[, num_shots := max(schuss %% 10) + 1,
                      by = .(series, day)
                      ][num_shots == 10,
                        ][, .(ergebnis_dec = sum(dec), ergebnis_full = sum(full)),
                          by = .(series, day)] 
  return(table2)
}



