library(dplyr)
library(plotly)
library(shiny)

# Creates scatter plot based on user choice 
build_scatter <- function(data, speciePicked , sampleSize) {
  specieName <- toString(speciePicked)
  species_data <- data %>% 
                  filter(Species == speciePicked) %>% 
                  sample_n(sampleSize)
  if(speciePicked == "setosa"){
    speciePicked <- "Setosa"
  } else if (speciePicked == "versicolor") {
    speciePicked <- "Versicolor"
  } else {
    speciePicked <- "Virginica"
  }
  selected_title <- paste("Sepal Length Compared to Petal Length of Specie:", speciePicked)
  
  userPlot <- plot_ly(data = species_data, 
                     x = Sepal.Length, 
                     y = Petal.Length, 
                     mode = "markers", 
                     marker = list(color = 'DeepSkyBlue')) %>%
                     layout(title = selected_title)
  return(userPlot)
}