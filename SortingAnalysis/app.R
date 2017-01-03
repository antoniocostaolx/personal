# Load up the shiny package.
library(shiny)
#Load the file containing the DataFrame with Autovit data
load("ExibitionAutovit.RData")
#Load the file containing DataFrame with Otomot data
load("ExibitionOtomoto.RData")

#Define the Shiny Server informations
server <- function(input, output) {
  output$AutovitTable <- renderDataTable({
    ExibitionAutovit}, options = list(paging = FALSE,
                                      searching = FALSE,
                                      orderClasses = TRUE,
                                      order = list(list(0, 'desc'))
                                      )
    )
  
  output$OtomotoTable <- renderDataTable({
    ExibitionOtomoto}, options = list(paging = FALSE,
                                      searching = FALSE,
                                      orderClasses = TRUE,
                                      order = list(list(0, 'desc'))
                                      )
  )
}

#Define the UI Shiny Informations
ui <- fluidPage(
  #Title of the page
  titlePanel("Sorting Analysis"),
  
  
  tabsetPanel(id = "tabSelected",
              tabPanel("Autovit", dataTableOutput("AutovitTable"),
                       helpText("Analysis of the amount of use of the sorting 
                                function per Mileage and Power Engine in relation to total sortings"),
                       helpText("Source: Google Analytics Date: ",
                                AutovitExecutedDate)
                       ),
              tabPanel("Otomoto", dataTableOutput("OtomotoTable"),
                       helpText("Analysis of the amount of use of the sorting 
                                function per Mileage and Power Engine in relation to total sortings"),
                       helpText("Source: Google Analytics Date: ",
                                OtomotoExecutedDate)
                       )
  )
)


shinyApp(ui = ui, server = server)
