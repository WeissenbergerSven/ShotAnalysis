#------------ PACKAGES ----------
library(shiny)
library(devtools)
library(ShotAnalysis)
library(data.table)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(shiny)
library(ggplot2)
library(plotly)

# -------- SERVER MODS -----------
source("./all_shots/all_shots_server.R")
source("./serien/serien_server.R")
#--------- UI MODS ------------
source("./all_shots/all_shots_ui.R")
source("./serien/series_ui.R")
# ------------ MAIN UI ----------
ui <- navbarPage(title = "Page",
           tabPanel("All Shoots in one picture", mod_ui_all_shots("ns_all_shots")),
           tabPanel("Series run", mod_ui_serien("ns_serien")),
           tabPanel("tab 3", "contents"))
# ----------- MAIN SERVER -----------
server <- function(input, output, session) {
  callModule(mod_server_all_shots, "ns_all_shots")
  callModule(mod_server_serien, "ns_serien")
  }

shinyApp(ui = ui, server = server)