
####---INPUT OUTPUT DASHBOARD---####

####---LIBRARY---####
#---DASH
library(shiny)
#library(shinyEffects)
#library(shinyjqui)
#library(shinyWidgets)
library(bs4Dash)
library(bs4cards)
library(thematic)
library(waiter)

#---DATA
library(readxl)
library(DT)
library(rgdal)

#---CONTENT
#library(ggpubr)
#library(ggthemes)
#library(ggforce)
library(dplyr)
library(stringr)
library(tidyr)
library(plotly)
library(leaflet)


thematic_shiny()

####---DATA---####
source("data/dataframe.R")


####---FUNCTIONS---####
source("function/dought.R")
source("function/bar.R")
source("function/bar 2.R")
source("function/stack.R")
source("function/stack 2.R")
source("function/table_text.R")
source("function/map.R")
source("function/chor map.R")



####---TABS UNTIDY---####
source("tab items/output tab 2.R") #
source("tab items/map tab.R") #
source("tab items/intermediate tab.R") #
source("tab items/demand tab.R") #
source("tab items/download tab.R") #


####---USER INTERFACE---####
source("int/ui.R")

####---SERVER---####
source("int/server.R")

####---RUN THE APP---####
#Run the app
shinyApp(ui = ui, server = server)















