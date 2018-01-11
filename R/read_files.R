#-----------------GET LIST OF TABLES------------

#' get the information
#' 
#' Read the excel tables and edit them.
#' @param path_to_excel String. Path to the excel table.
#' @param remove_empty Boolean. If \code{TRUE} remove the empty table in the list.
#' @return list of data.table with the edited excel tables.
#' @examples 
#' get_shoting_list(path_to_excel = "Desktop/excel/")
#' @export
get_shooting_list <- function(path_to_excel,
                              remove_empty = T, ...){
  LIST_OF_TABLE <- get_the_one_list(path_to_excel = PATH_TO_EXCEL_TABLE,
                                    lists_of_excel = LIST_OF_TABLE_FROM_EXCEL,
                                    remove_empty = T)
  LIST_OF_TABLE$Shots <- clean_shots(LIST_OF_TABLE$Shots)
  return(LIST_OF_TABLE)
  
}

# ------------------READ TABLES--------------

#' Read one excel table.
#'
#' For given path, read the excel table with name \code{name_excel_table}.
#' @param name_excel_table String. Name of the excel table.
#' @param path_to_excel String. Path to the excel table.
#' @param format String. Ending of the filename.
#' @return data.table
lese_excel <- function(name_excel_table, path_to_excel, format = ".xlsx", ...){
  paste0(path_to_excel, name_excel_table, format) %>% # get the right name
    read_excel() %>%             # read the table
    as.data.table()              # convert into data.table
}

#' Save excel-tables in one list .
#'
#' @param path_to_excel String. Path to the folder of the tables
#' @param list_of_excel Character Vector. Names of the excel-tables.
#' @param remove_empty Boolean. If \code{TRUE} remove the empty table in the list.
#' @return list.
get_the_one_list <- function(path_to_excel = PATH_TO_EXCEL_TABLE,
                             lists_of_excel = LIST_OF_TABLE_FROM_EXCEL,
                             remove_empty = T,...){
  list_of_table <- list()
  for(i in lists_of_excel){
    table <- lese_excel(name_excel_table = i,
                        path_to_excel = path_to_excel)
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


#------------EDIT TABLES------------

#' Edit character of Shots
#'
#' Separate the one column in Shots into multiple columns
#' and then separate the relevant information.
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
#' @param x data.table. Shots table
#' @return data.table. with separated columns.
clean_shots <- function(x, ...){
  # Separate into multiple columns
  y <- x %>% 
    separate(shotdata, into = SHOTS_COLUMNS, sep = "=")
  # Remove the character around the information
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



