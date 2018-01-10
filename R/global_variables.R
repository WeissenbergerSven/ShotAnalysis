# Path where to find the excel table
PATH_TO_EXCEL_TABLE <- "../excelTable/"

# Remove empty table?
REMOVE_EMPTY_TABLE <- TRUE

# List of all excel table---------------
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

# Columns of Shots----------
SHOTS_COLUMNS <- c("first",
                   "x",
                   "y",
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





devtools::use_data(PATH_TO_EXCEL_TABLE,      overwrite = TRUE)
devtools::use_data(REMOVE_EMPTY_TABLE,       overwrite = TRUE)
devtools::use_data(LIST_OF_TABLE_FROM_EXCEL, overwrite = TRUE)
devtools::use_data(SHOTS_COLUMNS,            overwrite = TRUE)
