library(dplyr)
library(lubridate)
library(writexl)

full_data <- read.csv("divorce.csv")

print("--- 1. Original Dataset Loaded ---")
print(head(full_data))

duplicates_report <- full_data %>%
  group_by_all() %>%
  count() %>%
  filter(n > 1)

print("--- 2. Duplicate Rows Detected ---")
print(duplicates_report)

clean_data <- full_data %>% distinct()
data <- head(clean_data, 10)

current_time <- now()
print("--- Current System Time for Report ---")
print(paste("Analysis Run Year:", year(current_time)))
print(paste("Analysis Run Time:", hour(current_time), ":", minute(current_time)))

lin_model <- lm(trust_score ~ communication_score, data = data)
lin_coefficients <- as.data.frame(summary(lin_model)$coefficients)

log_model <- glm(divorced ~ financial_stress_level, data = data, family = binomial)
log_coefficients <- as.data.frame(summary(log_model)$coefficients)

write.csv(data, "Regression_Data_S071.csv", row.names = FALSE)
write.csv(lin_coefficients, "Linear_Coefficients_S071.csv")
write.csv(log_coefficients, "Logistic_Coefficients_S071.csv")

write_xlsx(data, "Regression_Analysis_S071.xlsx")

pdf("Regression_Plots_S071.pdf", width = 8, height = 11)
par(mfrow = c(2, 1))




plot(data$communication_score, data$trust_score, 
     main = "Linear Regression: Communication vs Trust",
     xlab = "Communication Score", ylab = "Trust Score", 
     pch = 19, col = "steelblue")
abline(lin_model, col = "darkred", lwd = 2)


plot(data$financial_stress_level, data$divorced,
     main = "Logistic Regression: Financial Stress vs Divorce",
     xlab = "Financial Stress Level", ylab = "Probability of Divorce (0 to 1)",
     pch = 19, col = "darkgreen")
curve(predict(log_model, data.frame(financial_stress_level = x), type = "response"), 
      add = TRUE, col = "orange", lwd = 2)

dev.off()

print("--- Analysis Complete. Files 'S071' generated. ---")