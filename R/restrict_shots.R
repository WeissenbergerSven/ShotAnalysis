# ----------ROWS SHOTS--------------
#' remove rows from Shots
#' 
#' @param table_shot data.table
#' return data.table
remove_rows <- function(table_shot){
  # remove the winkel == NA (Here olso x_co == -7000 and y_co == 7000)
  table <- table_shot[!is.na(winkel)]
  # remove the pistol 
  table <- table[disktype == "lg"]
  return(table)
}


# ---------COLUMNS SHOTS----------------
#' remove columns from Shots
#' 
#' @param table_shot data.table
#' return data.table
remove_columns <- function(table_shot){
  table <- table_shot[,.(idShots,
                         fidShooters, 
                         shot,
                         x_co,
                         y_co,
                         teiler,
                         winkel,
                         disktype,
                         full,
                         shottimestamp
                         )]
  return(table)
}


