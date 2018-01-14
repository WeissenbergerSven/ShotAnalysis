customPlotUI <- function(id){
  ns <- NS(id)
  
  name_table <- LIST_OF_TABLE$Shooters[,.(name = paste0(lastname, ", ", firstname),
                                          idShooters)] %>% unique()
  name_selector <- name_table$idShooters
  names(name_selector)<- name_table$name
  
  sidebarLayout(
    sidebarPanel(
      selectizeInput(inputId = "shooter" %>% ns,
                     label = "Choose a person",
                     choices = name_selector,
                     selected = 141),
      dateRangeInput(inputId = "all_date" %>% ns,
                     label = "Choose daterange",
                     start = "2016-12-01",
                     end = "2017-11-24",
                     min = "2016-12-1",
                     max = Sys.Date())
      
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("All Shots", plotOutput("plot" %>% ns))
        
      )
    )
  )
}