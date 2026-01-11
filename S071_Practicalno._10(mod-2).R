
library(ggplot2)
library(readr)

mydata <- read_csv("medical_cost_prediction_dataset.csv")

# View structure
str(mydata)

# -----------------------------------------
# Convert Variables (if needed)
# -----------------------------------------
mydata$gender <- as.factor(mydata$gender)
mydata$smoker <- as.factor(mydata$smoker)

# -----------------------------------------
# 1. Bar Plot: Count of Patients by Gender
# -----------------------------------------
ggplot(mydata, aes(x = gender)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Number of Patients by Gender",
    x = "Gender",
    y = "Count"
  ) +
  theme_minimal()

# -----------------------------------------
# 2. Histogram: Distribution of BMI
# -----------------------------------------
ggplot(mydata, aes(x = bmi)) +
  geom_histogram(binwidth = 2, fill = "orange", color = "black") +
  labs(
    title = "BMI Distribution",
    x = "BMI",
    y = "Frequency"
  ) +
  theme_minimal()

# -----------------------------------------
# 3. Scatter Plot: Age vs Annual Medical Cost
# -----------------------------------------
ggplot(mydata, aes(x = age, y = annual_medical_cost)) +
  geom_point(color = "darkgreen", size = 2) +
  labs(
    title = "Age vs Annual Medical Cost",
    x = "Age",
    y = "Annual Medical Cost"
  ) +
  theme_minimal()

# -----------------------------------------
# 4. Box Plot: Medical Cost by Smoking Status
# -----------------------------------------
ggplot(mydata, aes(x = smoker, y = annual_medical_cost)) +
  geom_boxplot(fill = "purple") +
  labs(
    title = "Annual Medical Cost by Smoking Status",
    x = "Smoker",
    y = "Annual Medical Cost"
  ) +
  theme_minimal()

# -----------------------------------------
# 5. Scatter Plot: Daily Steps vs Stress Level
# -----------------------------------------
ggplot(mydata, aes(x = daily_steps, y = stress_level)) +
  geom_point(color = "red", size = 2) +
  labs(
    title = "Daily Steps vs Stress Level",
    x = "Daily Steps",
    y = "Stress Level"
  ) +
  theme_minimal()

