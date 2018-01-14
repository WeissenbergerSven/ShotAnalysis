mod_ui_serien <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
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
        tabPanel("Serein verlauf", plotOutput("serien_over_time" %>% ns))
        
      )
    )
  )
}