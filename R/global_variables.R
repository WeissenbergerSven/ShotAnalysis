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
  devtools::use_data(LIST_OF_TABLE_FROM_EXCEL)
  return(T)
}


# -------------Columns of Shots----------
#' save the columnnames of shots in the package datafile
#' 
#' @return Boolean.
#' @export
load_SHOTS_COLUMNS <- function(){
  SHOTS_COLUMNS <- c("first",
                     "x_co",
                     "y_co",
                     "teiler",
                     "ishot",
                     "isvalid",
                     "datetime",
                     "disktyp",
                     "isinnerten",
                     "commentvalid",
                     "valuation",
                     "innerten",
                     "full",
                     "dec")
  devtools::use_data(SHOTS_COLUMNS)
  return(TRUE)
}





