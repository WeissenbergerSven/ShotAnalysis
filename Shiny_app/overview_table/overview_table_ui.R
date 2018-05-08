mod_ui_overview_table <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
  tagList(
    tabPanel("All Shots",
             dataTableOutput("mytable" %>% ns)
    )
  )
}
