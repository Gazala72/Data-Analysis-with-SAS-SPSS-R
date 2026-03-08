install.packages(c("tidyverse","lubridate","corrplot",
                   "caret","randomForest","nnet"))

library(tidyverse)
library(lubridate)
library(corrplot)
library(caret)
library(randomForest)
library(nnet)

# 2. Import Dataset
aqi_data <- read.csv("city_day.csv", check.names = FALSE)

print("Dataset Structure")
str(aqi_data)

print("Summary Statistics")
summary(aqi_data)

# 3. Data Cleaning
# Convert Date
aqi_data$Date <- as.Date(aqi_data$Date)

# Extract Year and Month
aqi_data$Year <- year(aqi_data$Date)
aqi_data$Month <- month(aqi_data$Date)

# Fill missing values with median
numeric_cols <- c("PM2.5","PM10","NO","NO2","NOx",
                  "NH3","CO","SO2","O3",
                  "Benzene","Toluene","Xylene","AQI")

for(col in numeric_cols){
  aqi_data[[col]][is.na(aqi_data[[col]])] <- 
    median(aqi_data[[col]], na.rm = TRUE)
}

# 4. Exploratory Data Analysis
# AQI Distribution
ggplot(aqi_data, aes(x = AQI)) +
  geom_histogram(bins = 30, fill = "skyblue") +
  ggtitle("Distribution of AQI") +
  theme_minimal()

# 5. Correlation Matrix
numeric_data <- aqi_data %>%
  select(`PM2.5`, PM10, NO, NO2, NOx, NH3,
         CO, SO2, O3, Benzene,
         Toluene, Xylene, AQI)

cor_matrix <- cor(numeric_data)

corrplot(cor_matrix,
         method = "color",
         type = "upper",
         tl.cex = 0.8)

# 6. Train-Test Split
set.seed(123)

trainIndex <- createDataPartition(aqi_data$AQI,
                                  p = 0.8,
                                  list = FALSE)

trainData <- aqi_data[trainIndex, ]
testData <- aqi_data[-trainIndex, ]

# 7. Linear Regression Model
lm_model <- lm(AQI ~ `PM2.5` + PM10 + NO + NO2 +
                 NOx + CO + SO2 + O3,
               data = trainData)

print("Linear Regression Summary")
summary(lm_model)

predictions <- predict(lm_model, testData)

# Evaluation
rmse <- sqrt(mean((predictions - testData$AQI)^2))
mae <- mean(abs(predictions - testData$AQI))
r2 <- summary(lm_model)$r.squared

print(paste("Linear Regression RMSE:", rmse))
print(paste("Linear Regression MAE:", mae))
print(paste("Linear Regression R2:", r2))

# 8. AQI Classification Model
aqi_data$AQI_Bucket <- as.factor(aqi_data$AQI_Bucket)

multi_model <- multinom(AQI_Bucket ~ `PM2.5` + PM10 +
                          NO2 + CO + O3,
                        data = aqi_data)

print("Classification Model Summary")
summary(multi_model)

# 9. ANOVA Analysis
anova_model <- aov(AQI ~ City, data = aqi_data)

print("ANOVA Results")
summary(anova_model)

# 10. Random Forest Model
rf_model <- randomForest(AQI ~ `PM2.5` + PM10 +
                           NO2 + CO + O3,
                         data = trainData,
                         importance = TRUE)

rf_pred <- predict(rf_model, testData)

rf_rmse <- sqrt(mean((rf_pred - testData$AQI)^2))
rf_mae <- mean(abs(rf_pred - testData$AQI))

print(paste("Random Forest RMSE:", rf_rmse))
print(paste("Random Forest MAE:", rf_mae))

# Variable Importance
varImpPlot(rf_model)

# 11. Model Comparison


results <- data.frame(
  Model = c("Linear Regression","Random Forest"),
  RMSE = c(rmse, rf_rmse),
  MAE = c(mae, rf_mae)
)

print("Model Comparison")
print(results)


# 12. Export Results
write.csv(aqi_data, "Cleaned_AQI_Data.csv")

output <- data.frame(
  Actual = testData$AQI,
  Linear_Predicted = predictions,
  RF_Predicted = rf_pred
)

write.csv(output, "AQI_Predictions.csv")

print("Project Completed Successfully")

