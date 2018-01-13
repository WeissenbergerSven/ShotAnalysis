library(shiny)
# sources for the panels
source("./ui/panel1.R")
# Define UI for application that draws a histogram
shinyUI(navbarPage(title = "Page",
                   tabPanel("All Shoots in one picture", p),
                   tabPanel("tab 2", "contents"),
                   tabPanel("tab 3", "contents"))
)
