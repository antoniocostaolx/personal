# Load up the shiny package.
library(shiny)
#Set the working directory for the file's source directory
setwd(getwd())


#Load the file containing the DataFrame with Autovit data
load("ExibitionAutovit.RData")
#Load the file containing DataFrame with Otomot data
load("ExibitionOtomoto.RData")

#Run the app.R with Server and UI Shiny
runApp("Shiny")
