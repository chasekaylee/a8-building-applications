library(dplyr)
library(plotly)
library(shiny)
source('build_scatter.R')

# Save iris data into variable
data <- iris

shinyServer(function(input, output) {
  output$scatterPlot <- renderPlotly({ 
    build_scatter(data, input$specie, input$sampleSize)
  })
})