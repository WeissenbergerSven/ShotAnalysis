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
# customPlotUI <- function(id) {
#   ns <- NS(id)
#   
#   tagList(
#     
#     numericInput("pointsize" %>% ns, "Choose Point Size", value = 1, step = 1),
#     plotOutput(ns("plot"))
#   )
# }

# customPlot <- function(input, output, session) {
#   
#   output$plot <- renderPlot({
#     ggplot() + geom_point(aes(x=input$pointsize,y=0))
#   })
#   
#   return()
# }

ui <- fluidPage(
  customPlotUI("plot1")
)

server <- function(input, output, session) {
  callModule(customPlot, "plot1")
}

shinyApp(ui = ui, server = server)