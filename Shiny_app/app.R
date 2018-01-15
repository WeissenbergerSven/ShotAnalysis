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
ui <-dashboardPage(
  dashboardHeader(), 
  dashboardSidebar(
    sidebarMenu(
      selectizeInput(inputId = "leftname", label = "Name", choices = c(144,141)),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", icon = icon("th"), tabName = "widgets"),
      menuItem("Charts", icon = icon("bar-chart-o"), startExpanded = TRUE,
               menuSubItem("Sub-item 1", tabName = "subitem1"),
               menuSubItem("Sub-item 2", tabName = "subitem2")
      )
    ),
    textOutput("res")
  ),
  dashboardBody(
    tabItems(
      tabItem("dashboard", mod_ui_all_shots("ns_all_shots")),
      tabItem("widgets", "Widgets tab content"),
      tabItem("subitem1", mod_ui_serien("ns_serien")),
      tabItem("subitem2", "Sub-item 2 tab content") 
    )
  )
)

# ----------- MAIN SERVER -----------
server <- function(input, output, session) {
  callModule(mod_server_all_shots, "ns_all_shots")
  callModule(mod_server_serien, "ns_serien", name = reactive(input$leftname))
  }

shinyApp(ui = ui, server = server)