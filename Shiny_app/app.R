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
library(shinydashboard)
library(plotly)

# -------- SERVER MODS -----------
source("./all_shots/all_shots_server.R")
source("./serien/serien_server.R")
#--------- UI MODS ------------
source("./all_shots/all_shots_ui.R")
source("./serien/series_ui.R")
# ------------ MAIN UI ----------
ui <-dashboardPage(
  dashboardHeader(title = "Shot Analysis"), 
  dashboardSidebar(
    sidebarMenu(
      selectizeInput(inputId = "leftname",
                     label = "Choose a person",
                     choices = name_selector,
                     selected = 141),
      menuItem("All shots", tabName = "all_shots", icon = icon("dashboard"),
               menuSubItem("All shots", tabName = "all_shots_over_time"),
               menuSubItem("X Variance", tabName = "all_shots_x_variance"),
               menuSubItem("Y Variance", tabName = "all_shots_y_variance")
    ),
      menuItem("Serien", icon = icon("bar-chart-o"), startExpanded = TRUE,
               menuSubItem("Serien over time", tabName = "serien_over_time"),
               menuSubItem("Sub-item 2", tabName = "subitem2")
      )
    ),
    textOutput("res")
  ),
  dashboardBody(
    tabItems(
      tabItem("all_shots_over_time", mod_ui_all_shots_all("ns_all_shots")),
      tabItem("all_shots_x_variance", mod_ui_all_shots_x("ns_all_shots")),
      tabItem("all_shots_y_variance", mod_ui_all_shots_y("ns_all_shots")),
      
      tabItem("serien_over_time", mod_ui_serien("ns_serien")),
      tabItem("subitem2", "Sub-item 2 tab content") 
    )
  )
)

# ----------- MAIN SERVER -----------
server <- function(input, output, session) {
  callModule(mod_server_all_shots, "ns_all_shots", name = reactive(input$leftname))
  callModule(mod_server_serien, "ns_serien", name = reactive(input$leftname))
  }

shinyApp(ui = ui, server = server)