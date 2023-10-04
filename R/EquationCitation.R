# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

downloaddata <- function() {
  #install.packages("ggplot2")
  #install.packages("dplyr")
  #install.packages("viridis")


  Main_data <- read.csv("EquationCitations.csv", header = TRUE)
}

summarrize_Citations <- function(Main_data) {
  summary(Main_data)
}

Cites_per_journal <- function(df) {
  df %>%
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

find_max_of_given_column <- function(column1) {

  Main_data <- read.csv("EquationCitations.csv", header = TRUE)
  Main_data[which.max(Main_data$column1), ]

}







