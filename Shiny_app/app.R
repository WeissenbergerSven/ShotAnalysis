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

# -------- SERVER MODS -----------
source("./server_mod/overview_server.R")
#--------- UI MODS ------------
source("./ui_mod/overview_ui.R")

ui <- navbarPage(title = "Page",
           tabPanel("All Shoots in one picture", mod_ui_all_shots("ns_all_shots")),
           tabPanel("tab 2", "contents"),
           tabPanel("tab 3", "contents"))

server <- function(input, output, session) {
  callModule(mod_server_all_shots, "ns_all_shots")
}

shinyApp(ui = ui, server = server)