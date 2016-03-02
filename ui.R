# library the dplyr, plotly, and shiny packages
library(dplyr)
library(plotly)
library(shiny)

# Define UI for an application that has a title
shinyUI(
  
  # Specifies a fluidPage layout 
  fluidPage(
    
    # Creates a title in fluidPage
    titlePanel("Iris Flower Species"),
    
    sidebarLayout(
      
      sidebarPanel(
        # Allows user to select what species to observe
        radioButtons("specie", label = h3("Choose Species"),
                     choices = list("Setosa" = 'setosa', "Versicolor" = 'versicolor', "Virginica" = 'virginica'), 
                     selected = 'setosa'),
   
        # Allows user to adjust sample size
        sliderInput("sampleSize", label = h3("Number of Observations"), min = 1, 
                    max = 50, value = 25)
      ),
      
      mainPanel(
        plotlyOutput("scatterPlot")
      )
    )
  )
)