#' Download Data
#'
#' Downloads and reads data from the "EquationCitations.csv" file.
#'
#' @return A data frame containing the downloaded data.
#' @importFrom utils read.csv
#'
#' @examples
#' downloaddata()
#'
downloaddata <- function() {
  # install.packages("ggplot2")
  # install.packages("dplyr")
  # install.packages("viridis")
  
  # Read the data
  Main_data <- read.csv("EquationCitations.csv", header = TRUE)
  
  return(Main_data)
}

#' Summarize Citations
#'
#' Generates a summary of the main data frame.
#'
#' @param Main_data A data frame containing the data to be summarized.
#' @return Summary statistics of the data.
#'
#' @examples
#' summarrize_Citations(Main_data)
#'
summarrize_Citations <- function(Main_data) {
  summary(Main_data)
}

#' Citations per Journal
#'
#' Calculates the total citations per journal(3).
#'
#' @param Main_data A data frame containing the data.
#' @return A data frame with journal-wise total citations.
#'
#' @import dplyr
#'
#' @examples
#' Cites_per_journal(Main_data)
#'
Cites_per_journal <- function(Main_data) {
  library(dplyr)
  Main_data %>%
    group_by(journal) %>%
    summarize(total_citations = sum(cites))
}

#' Graph Citations per Journal
#'
#' Generates a bar graph of total citations per journal.
#'
#' @param Main_data A data frame containing the data.
#' @return A ggplot2 graph object.
#'
#' @import ggplot2
#'
#' @examples
#' graph_cites_per_journal(Main_data)
#'
graph_cites_per_journal <- function(Main_data){
  library(ggplot2)
  ggplot(Main_data, aes(x = journal, y = cites)) +
    geom_col( fill = "blue") +
    labs(x = "Journal", y = "Total Citations", title = "Total Citations by Author in AmNat") +
    coord_flip() +
    theme_classic()
}

#' Make Scatterplot
#'
#' Creates a scatterplot of equations vs. citations, filtering out rows with 0 equations or citations.
#'
#' @param Main_data A data frame containing the data.
#'
#' @examples
#' make_scatterplot(Main_data)
#'
make_scatterplot <- function(Main_data) {
  # Filter the rows where both "equations" and "cites" are greater than 0
  filtered_data <- Main_data[Main_data$equations > 0 & Main_data$cites > 0, ]
  
  # Create a scatterplot
  plot(filtered_data$equations, filtered_data$cites,
       xlab = "Equations", ylab = "Citations",
       main = "Scatterplot of Equations vs. Citations")
}

#' Average Pages per Journal
#'
#' Calculates the average number of pages per journal.
#'
#' @param Main_data A data frame containing the data.
#'
#' @import dplyr
#'
#' @examples
#' average_pages(Main_data)
#'
average_pages <- function(Main_data) {
  # Load the dplyr package if not already loaded
  library(dplyr)
  # Group the dataframe by the "journal" column and calculate the average pages
  result <- Main_data %>%
    group_by(journal) %>%
    summarise(average_pages = mean(pages, na.rm = TRUE))
  
  return(result)
}














