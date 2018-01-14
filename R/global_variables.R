######  devtools::use_data(LIST_OF_TABLE_FROM_EXCEL, overwrite = T) cant be load in 
######  function so save them otherwise
 


# ------------List of all excel table---------------
#' save namelist of the excel tables in the package datafile
#' 
#' @return Boolean.
#' @export
load_LIST_OF_TABLE_FROM_EXCEL <- function(){
  LIST_OF_TABLE_FROM_EXCEL <- list("AllowedClasses",
                                   "AllowedGroups",
                                   "AllowedWeapons",
                                   "CashbookAccountTypes",
                                   "CashbookJournal",
                                   "CashbookShooterAccounts",
                                   "CashbookTypes",
                                   "Classes",
                                   "Clubs",
                                   "Combinations",
                                   "CombinationsElements",
                                   "Competitions",
                                   "CompetitionsTakeovers",
                                   "Configs",
                                   "Contingent",
                                   "Groups",
                                   "LinkSIZItemsCompetitions",
                                   "Logs",
                                   "Menuclasses",
                                   "MenuclassesCompetitions",
                                   "ShooterGroups",
                                   "Shooters",
                                   "ShootersCompetitions",
                                   "ShooterWeapons",
                                   "Shots",
                                   "ShotsCertificate",
                                   "ShotsRecycleBin",
                                   "SIZItems",
                                   "Teams",
                                   "Weapons"
  )
  devtools::use_data(LIST_OF_TABLE_FROM_EXCEL, overwrite = T)
  return(T)
}


# -------------Columns of Shots----------
#' save the columnnames of shots in the package datafile
#' 
#' @return Boolean.
#' @export
load_SHOTS_COLUMNS <- function(){
  SHOTS_COLUMNS <- c("first",
                     "shootingrange",
                     "shootersid",
                     "shot",
                     "shotcount",
                     "run",
                     "isvalid",
                     "ishot",
                     "iswarm",
                     "x_co",
                     "y_co",
                     "teiler",
                     "winkel",
                     "disktype",
                     "dummy",
                     "shotTime",
                     "menuid",
                     "datetime",
                     "isinnerten",
                     "commentvalid",
                     "valuation",
                     "innerten",
                     "full",
                     "dec"
  )
  devtools::use_data(SHOTS_COLUMNS, overwrite = T)
  return(TRUE)
}

# ------------- ChOICES FOR PERSON ----------
#' Create the person choice for the UI 
#' 
#' @return Boolean.
#' @export
load_PERSON_CHOOSE <- function(){
  name_table <- LIST_OF_TABLE$Shooters[,.(name = paste0(lastname, ", ", firstname),
                                          idShooters)] %>% unique()
  name_selector <- name_table$idShooters
  names(name_selector)<- name_table$name
  devtools::use_data(name_selector, overwrite = T)
  return(TRUE)
}



