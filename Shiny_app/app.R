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
source("./server_mod/overview_server.R")
source("./ui_mod/overview_ui.R")

ui <- navbarPage(title = "Page",
           tabPanel("All Shoots in one picture", customPlotUI("plot1")),
           tabPanel("tab 2", "contents"),
           tabPanel("tab 3", "contents"))

server <- function(input, output, session) {
  callModule(customPlot, "plot1")
}

shinyApp(ui = ui, server = server)