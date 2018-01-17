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
  # set the first shot to 1 
  
  
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
                         dec,
                         shottimestamp,
                         day = as.Date(shottimestamp)
  )]
  # Renumber the shoots because at some days there are multiple shot == 1
  table_all <- data.table()
  for(j in unique(table$fidShooters)){
    for(i in unique(table$day)){
      tab <- table[day == i & fidShooters == j]
      tab$schuss <- 1:nrow(tab)
      table_all <- rbind(table_all, tab)
    }
  }
  return(table_all)
}


