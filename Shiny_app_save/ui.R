# sources for the panels
source("./ui/panel1.R")
# Define UI for application that draws a histogram
shinyUI(navbarPage(title = "Page",
                   tabPanel("All Shoots in one picture", customPlotUI("plot1")),
                   tabPanel("tab 2", "contents"),
                   tabPanel("tab 3", "contents"))
)
