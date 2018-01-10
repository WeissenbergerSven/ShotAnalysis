#' Read excel table.
#'
#' For given path, read the excel table with name x.
#' @param name String. Name of the excel table.
#' @param path String. Path to the excel table.
#' @param format String. Ending of the filename.
#' @return data.table
#' @import data.table
#' @import tidyr
#' @importFrom readxl read_excel
#' @importFrom dplyr %>% 
#' @export
lese_excel <- function(name, path, format = ".xlsx", ...){
  paste0(path, name, format) %>% # get the right name
    read_excel() %>%             # read the table
    as.data.table()              # convert into data.table
}

#' Save tables in one list .
#'
#' @param list_of_excel Character Vector. Names of the excel-tables.
#' @param path String. Path to the folder of the tables
#' @param remove_empty Boolean.
#' @return list.
get_the_one_list <- function(lists_of_excel = LIST_OF_TABLE_FROM_EXCEL,
                             path = PATH_TO_EXCEL_TABLE,
                             remove_empty = REMOVE_EMPTY_TABLE,...){
  list_of_table <- list()
  for(i in lists_of_excel){
    table <- lese_excel(i, path = path)
    if(remove_empty){ # Check if you want to delete empty table
      if(nrow(table) > 0){  # Only save not-emtpy tables
        list_of_table[[i]] <- table
      }
    }else{
      list_of_table[[i]] <- table
    }
  }
  return(list_of_table)
}
# LIST_OF_TABLE <- get_the_one_list(lists_of_excel = LIST_OF_TABLE_FROM_EXCEL,
#                                   path = PATH_TO_EXCEL_TABLE,
#                                   remove_empty = REMOVE_EMPTY_TABLE)



#' Edit character of Shots
#'
#' Separate the one column in Shots into multiple columns
#' and then separate the additional information.
#'
#' @param x String. of the form "\"information\"text".
#' @return String. with just the information.
delete_character <- function(x, ...){
  y <- sub("\"", "", x)
  z <- sub("\".*", "", y)
  return(z)
}

#' Filter only the information
#'
#' @param x data.table. Shots
#' @return data.table. with separated columns.
clean_shots <- function(x, ...){
  # Separate into multiple columns
  y <- x %>% separate(shotdata, into = SHOTS_COLUMNS, sep = "=")
  # Remove the character aound the information
  z <- y[, ':='(first = NULL,
                x            = lapply(x, delete_character),
                y            = lapply(y, delete_character),
                teiler       = lapply(teiler, delete_character),
                ishot        = lapply(ishot, delete_character),
                isvalid      = lapply(isvalid, delete_character),
                datetime     = lapply(datetime, delete_character),
                disktyp      = lapply(disktyp, delete_character),
                isinnerten   = lapply(isinnerten, delete_character),
                commentvalid = lapply(commentvalid, delete_character),
                valuation    = lapply(valuation, delete_character),
                innerten     = lapply(innerten, delete_character),
                full         = lapply(full, delete_character),
                dec          = lapply(dec, delete_character)
  )]
  return(z)
}

#LIST_OF_TABLE$Shots <- clean_shots(LIST_OF_TABLE$Shots)

