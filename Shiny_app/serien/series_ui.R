mod_ui_serien <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
  
  tagList(
    
    dateRangeInput(inputId = "all_date" %>% ns,
                   label = "Choose daterange",
                   start = "2016-12-01",
                   end = "2017-11-24",
                   min = "2016-12-1",
                   max = Sys.Date()),
    plotOutput("serien_over_time" %>% ns)
    
  )
  
  
}