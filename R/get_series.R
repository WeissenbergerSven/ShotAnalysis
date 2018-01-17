#' Get series of a Shooter
#' 
#' @param shoot_table data.table
#' @return data.table
#' @export
get_series <- function(shoot_table){
  # Check if right table
  if(!all(c("day", "dec", "full", "schuss") %in% names(shoot_table))){
    stop("Wrong data.table.")
  }

  # Get the seriesnumber
  shoot_table[, series := ceiling(schuss/10)]
  
  # Filter only the finished series
  table2 <- shoot_table[, num_shots := max(schuss %% 10) + 1,
                      by = .(series, day)
                      ][num_shots == 10,
                        ][, .(ergebnis_dec = sum(dec), ergebnis_full = sum(full)),
                          by = .(series, day)] 
  return(table2)
}



