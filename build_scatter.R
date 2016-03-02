library(dplyr)
library(plotly)
library(shiny)

# Creates scatter plot based on user choice 
build_scatter <- function(data, speciePicked , colorPicked, sampleSize) {
  speciePicked <- toString(speciePicked)
  species_data <- data %>% 
                  filter(Species == speciePicked) %>% 
                  sample_n(sampleSize)
  
  plot_title <- paste("Sepal Length Compared to Petal Length of Specie:", 
                      if(speciePicked == "setosa"){
                          speciePicked <- "Setosa"
                      } else if (speciePicked == "versicolor") {
                          speciePicked <- "Versicolor"
                      } else {
                        speciePicked <- "Virginica"
                      }
    )
  
  scatter <- plot_ly(
    data = species_data, x = Sepal.Length, y = Petal.Length, mode = "markers", marker = list(color = colorPicked)) %>%
    layout(title = plot_title)
  return(scatter)
}