# Install required packages (run once)
install.packages(c("ggplot2", "readr"))

# Load libraries
library(ggplot2)
library(readr)
# Clear environment
rm(list = ls())

# Load data
life <- read.csv("Updated Quality of Life Data(1).csv")

# Linear regression model
model_lm <- lm(
  age_at_death ~ 
    avg_work_hours_per_day +
    avg_rest_hours_per_day +
    avg_sleep_hours_per_day +
    avg_exercise_hours_per_day,
  data = life
)

# Model summary
summary(model_lm)

# Predict age at death
life$predicted_age <- predict(model_lm, newdata = life)

# Base R plot (SAFE & ERROR-FREE)
plot(
  life$age_at_death,
  life$predicted_age,
  main = "Actual vs Predicted Age at Death",
  xlab = "Actual Age at Death",
  ylab = "Predicted Age at Death",
  pch = 16
)

# Regression line
abline(lm(predicted_age ~ age_at_death, data = life), col = "red", lwd = 2)

