mod_ui_all_shots_all <- function(id){
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
    
    tabPanel("All Shots", plotOutput("all_shots" %>% ns))
  )
}
mod_ui_all_shots_x <- function(id){
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
    
    tabPanel("x Variance" , plotOutput("x_variance" %>% ns))
    
  )
}
mod_ui_all_shots_y <- function(id){
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
    tabPanel("y Variance" , plotOutput("y_variance" %>% ns))
    
  )
}