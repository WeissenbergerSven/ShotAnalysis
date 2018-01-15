mod_ui_serien <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
  
  tagList(
    
    plotlyOutput("serien_over_time" %>% ns)
    
  )
  
  
}