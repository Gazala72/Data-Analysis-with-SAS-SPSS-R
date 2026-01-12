# -----------------------------------------
# Aim: Creating Graphical Reports using ggplot2
# -----------------------------------------
library(ggplot2)
library(readr)
library(dplyr)
mydata <- read_csv("medical_cost_prediction_dataset.csv")

# View structure
str(mydata)

# -----------------------------------------
# Convert categorical variables
# -----------------------------------------
mydata$gender <- as.factor(mydata$gender)
mydata$smoker <- as.factor(mydata$smoker)

# =====================================================
# 1. SCATTER PLOT
# Age vs Annual Medical Cost
# =====================================================
ggplot(mydata, aes(x = age, y = annual_medical_cost)) +
  geom_point(size = 2) +
  labs(
    title = "Scatter Plot: Age vs Annual Medical Cost",
    x = "Age",
    y = "Annual Medical Cost"
  ) +
  theme_minimal()

# =====================================================
# 2. PIE CHART
# Smoking Status Distribution
# =====================================================

# Create summary data
pie_data <- mydata %>%
  group_by(smoker) %>%
  summarise(Count = n())

# Plot pie chart
ggplot(pie_data, aes(x = "", y = Count, fill = smoker)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(
    title = "Pie Chart: Smoking Status",
    fill = "Smoker"
  ) +
  theme_void()

# =====================================================
# 3. HIGH–LOW CHART
# Annual Medical Cost by Gender
# =====================================================

# Calculate high and low values
high_low_data <- mydata %>%
  group_by(gender) %>%
  summarise(
    Low = min(annual_medical_cost),
    High = max(annual_medical_cost)
  )

# Plot High–Low chart
ggplot(high_low_data, aes(x = gender)) +
  geom_linerange(aes(ymin = Low, ymax = High), size = 1.2) +
  labs(
    title = "High–Low Chart: Annual Medical Cost by Gender",
    x = "Gender",
    y = "Annual Medical Cost"
  ) +
  theme_minimal()

