

downloaddata <- function() {
  #install.packages("ggplot2")
  #install.packages("dplyr")
  #install.packages("viridis")


  Main_data <- read.csv("EquationCitations.csv", header = TRUE)
}

summarrize_Citations <- function(Main_data) {
  summary(Main_data)
}

Cites_per_journal <- function(Main_data) {
  library(dplyr)
  Main_data %>%
    group_by(journal) %>%
    summarize(total_citations = sum(cites))

}

graph_cites_per_journal <- function(Main_data){
  #Main_data <- read.csv("EquationCitations.csv", header = TRUE)

  library(ggplot2)
  ggplot(Main_data, aes(x = journal, y = cites)) +
    geom_col( fill = "blue") +
    labs(x = "Journal", y = "Total Citations", title = "Total Citations by Author in AmNat") +
    coord_flip() +
    theme_classic()
}



make_scatterplot <- function(Main_data) {
  # Filter the rows where both "equations" and "cites" are greater than 0
  filtered_data <- Main_data[Main_data$equations > 0 & Main_data$cites > 0, ]
  
  # Create a scatterplot
  plot(filtered_data$equations, filtered_data$cites,
       xlab = "Equations", ylab = "Citations",
       main = "Scatterplot of Equations vs. Citations")
}

average_pages <- function(Main_data) {
  # Load the dplyr package if not already loaded
  library(dplyr)
  # Group the dataframe by the "journal" column and calculate the average pages
  result <- Main_data %>%
    group_by(journal) %>%
    summarise(average_pages = mean(pages, na.rm = TRUE))
  
  return(result)
}

# Example usage:
# Assuming your dataframe is named 'df'
# Replace 'df' with the actual name of your dataframe















