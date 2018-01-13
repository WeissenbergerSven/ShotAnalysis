name_table <- LIST_OF_TABLE$Shooters[,.(name = paste0(firstname, ", ", lastname),
                                      idShooters)] %>% unique()
name_selector <- name_table$idShooters
names(name_selector)<- name_table$name

p <- sidebarLayout(
  sidebarPanel(
    selectizeInput(inputId = "shooter",
                   label = "Choose a person",
                   choices = name_selector)
   
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
)