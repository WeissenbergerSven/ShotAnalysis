mod_ui_all_shots_all <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
  tagList(
    tabPanel("All Shots",
             plotlyOutput("all_shots" %>% ns,
                          width = "500px",
                          height = "500px"))
  )
}
mod_ui_all_shots_x <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
  tagList(
    
    tabPanel("x Variance" , plotlyOutput("x_variance" %>% ns))
    
  )
}
mod_ui_all_shots_y <- function(id){
  # -------- CREATE NS --------
  ns <- NS(id)
  
  # --------- THE UI --------
  tagList(
    
    tabPanel("y Variance" , plotlyOutput("y_variance" %>% ns))
    
  )
}