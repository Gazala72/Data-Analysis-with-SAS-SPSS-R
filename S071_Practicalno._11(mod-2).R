library(ggplot2)
library(readr)

mydata <- read_csv("medical_cost_prediction_dataset.csv")
str(mydata)

# Convert categorical variables
mydata$gender <- as.factor(mydata$gender)
mydata$smoker <- as.factor(mydata$smoker)

# -----------------------------------------
# Histogram Plots
# -----------------------------------------

# Distribution of Annual Medical Cost
ggplot(mydata, aes(x = annual_medical_cost)) +
  geom_histogram(binwidth = 1000, fill = "steelblue", color = "black") +
  labs(
    title = "Distribution of Annual Medical Cost",
    x = "Annual Medical Cost",
    y = "Frequency"
  ) +
  theme_minimal()

# -----------------------------------------
# Box Plots
# -----------------------------------------

# Annual Medical Cost by Gender
ggplot(mydata, aes(x = gender, y = annual_medical_cost, fill = gender)) +
  geom_boxplot() +
  labs(
    title = "Annual Medical Cost by Gender",
    x = "Gender",
    y = "Annual Medical Cost"
  ) +
  theme_minimal()

