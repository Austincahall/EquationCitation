
Main_data <- read.csv("EquationCitations.csv", header = TRUE)

summary(Main_data)
library(dplyr)
Main_data %>%
  group_by(journal) %>%
  summarize(total_citations = sum(cites))

library(ggplot2)
ggplot(Main_data, aes(x = journal, y = cites)) +
  geom_col( fill = "blue") +
  labs(x = "Journal", y = "Total Citations", title = "Total Citations by Author") +
  coord_flip() +
  theme_classic()


ggplot(Main_data, aes(x = journal, y = othercites)) +
  geom_col( fill = "blue") +
  labs(x = "Journal", y = "Total Citations", title = "") +
  coord_flip() +
  theme_classic()

ggplot(Main_data, aes(x = journal, y = nontheocites)) +
  geom_col( fill = "blue") +
  labs(x = "Journal", y = "extra equations", title = "") +
  coord_flip() +
  theme_classic()

ggplot(Main_data, aes(x = journal, y = appequations)) +
  geom_col( fill = "blue") +
  labs(x = "Journal", y = "extra equations", title = "") +
  coord_flip() +
  theme_classic()

mean_pages_per_journal <- Main_data %>%
  group_by(journal) %>%
  summarize(mean_pages = mean(pages))


# Find the highest amount in the "cites" column
Main_data[which.max(Main_data$rownames), ]


cor(Main_data$equations, Main_data$cites)

library(viridis)
ggplot(Main_data, aes(x = equations, y = cites)) +
  geom_point(aes(fill = cites)) +
  coord_cartesian(xlim = c(0, 50), ylim = c(0, 500)) +
  scale_fill_viridis() +
  labs(x = "Equations", y = "Cites", title = "Heatmap of Equations and Cites")


