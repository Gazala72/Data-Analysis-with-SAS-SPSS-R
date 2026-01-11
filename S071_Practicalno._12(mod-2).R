library(ggplot2)
library(readr)

# 1. Load Data and Select First 20 Rows
qol_data <- read_csv("Updated Quality of Life Data.csv")
qol_subset <- head(qol_data, 20)

correlation_data <- qol_subset[, c(
  "avg_work_hours_per_day",
  "avg_rest_hours_per_day",
  "avg_sleep_hours_per_day",
  "avg_exercise_hours_per_day",
  "age_at_death"
)]

# Compute the correlation matrix
cor_matrix <- cor(correlation_data)

# Print the result
print("Correlation Matrix:")
print(cor_matrix)

# Plot 1: Scatter Plot (Example Relationship)
plot_scatter <- ggplot(
  qol_subset,
  aes(x = avg_sleep_hours_per_day, y = age_at_death)
) +
  geom_point(color = "darkblue", size = 3) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  theme_minimal() +
  labs(
    title = "Relationship Between Sleep Hours and Age at Death",
    subtitle = "Analysis of the first 20 records",
    x = "Average Sleep Hours per Day",
    y = "Age at Death"
  )

# Plot 2: Correlation Heatmap (Basic R)
heatmap(
  cor_matrix,
  main = "Correlation Matrix Heatmap (Quality of Life Data)",
  col = colorRampPalette(c("blue", "white", "red"))(20),
  symm = TRUE
)

# Print the scatter plot
print(plot_scatter)

