# ------------ PLOT ALL SHOT OVERVIEW ----------
mod_server_overview_table <- function(input, output, session, all_shot_table){
  
  #Plot dataTable
  output$mytable = renderDataTable({
    mtcars
  })
  
  return()
}