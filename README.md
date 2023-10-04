# EquationCitation
R package for BIOS 524

This R program provides a set of functions for Equation citation data. Analysis and visualization using the R. It is designed to work with data from the "EquationCitations.csv" file.

## Introduction

The program offers the following functions:

1. `downloaddata()`: Downloads and reads data from the "EquationCitations.csv" file.

2. `summarrize_Citations(Main_data)`: Generates a summary of the main data frame.

3. `Cites_per_journal(Main_data)`: Calculates the total citations per journal.

4. `graph_cites_per_journal(Main_data)`: Generates a bar graph of total citations per journal.

5. `make_scatterplot(Main_data)`: Creates a scatterplot of equations vs. citations, filtering out rows with 0 equations or citations.

6. `average_pages(Main_data)`: Calculates the average number of pages per journal.

