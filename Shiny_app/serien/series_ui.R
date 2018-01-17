mod_ui_serien <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
    tagList(
        plotlyOutput("serien_over_time" %>% ns)
  )
  
  
}

mod_ui_serien_shots <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  tagList(
        plotlyOutput("shots_in_serie" %>% ns)
    
  )
  
  
}