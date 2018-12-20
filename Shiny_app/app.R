#------------ PACKAGES ----------
library(shiny)
library(devtools)
library(ShotAnalysis)
library(data.table)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(shinydashboard)
library(plotly)
library(ggforce)

# -------- SERVER MODS -----------
source("./all_shots/all_shots_server.R")
source("./serien/serien_server.R")
source("./overview_table/overview_table_server.R")
#--------- UI MODS ------------
source("./all_shots/all_shots_ui.R")
source("./serien/series_ui.R")
source("./overview_table/overview_table_ui.R")

# ------------ MAIN UI ----------
ui <-dashboardPage(
  dashboardHeader(title = "Shot Analysis"), 
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview table", icon = icon("bar-chart-o"), 
               tabName = "neues_tab"),
      
      selectizeInput(inputId = "leftname",
                     label = "Choose a person",
                     choices = name_selector,
                     selected = 144),
      
      dateRangeInput(inputId = "left_all_date",
                     label = "Choose daterange",
                     start = "2016-12-01",
                     end = "2017-11-24",
                     min = "2016-12-1",
                     max = Sys.Date()),
      
      menuItem("All shots", icon = icon("dashboard"),
               startExpanded = FALSE,
               menuSubItem("All shots", tabName = "all_shots_over_time"),
               menuSubItem("X Variance", tabName = "all_shots_x_variance"),
               menuSubItem("Y Variance", tabName = "all_shots_y_variance")
      ),
      menuItem("Serien", icon = icon("bar-chart-o"), 
               menuSubItem("Serien over time", tabName = "serien_over_time"),
               menuSubItem("Shot in a serie", tabName = "shots_in_serie"),
               menuSubItem( "Shots after Shot", tabName = "shots_after_shot")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("all_shots_over_time", mod_ui_all_shots_all("ns_all_shots")),
      tabItem("all_shots_x_variance", mod_ui_all_shots_x("ns_all_shots")),
      tabItem("all_shots_y_variance", mod_ui_all_shots_y("ns_all_shots")),
      
      tabItem("serien_over_time", mod_ui_serien("ns_serien")),
      tabItem("shots_in_serie", mod_ui_serien_shots("ns_serien")),
      tabItem("shots_after_shot", mod_ui_serien_shots_after_shot("ns_serien")),
      
      tabItem("neues_tab", mod_ui_overview_table("ns_overview_date"))
    )
  )
)

# ----------- MAIN SERVER -----------
server <- function(input, output, session) {
  TABLE_SHOTS <-reactive({ LIST_OF_TABLE$Shots[fidShooters == input$leftname &
                                                 as.Date(shottimestamp) >= input$left_all_date[1]  &
                                                 as.Date(shottimestamp) <= input$left_all_date[2]]
  })
  callModule(mod_server_all_shots, "ns_all_shots",
             all_shot_table = TABLE_SHOTS)
  callModule(mod_server_serien, "ns_serien",
             all_shot_table = TABLE_SHOTS)
  callModule(mod_server_overview_table, "ns_overview_date")
}

shinyApp(ui = ui, server = server)