# AIM-14: Performing Logistic Regression using glm() in R

rm(list = ls())
df <- read.csv("divorce.csv")
str(df)

# Convert necessary columns to factors 
df$divorced <- as.factor(df$divorced)
df$employment_status <- as.factor(df$employment_status)
df$marriage_type <- as.factor(df$marriage_type)

# Logistic Regression Model
# Predicting divorce based on conflict frequency
model <- glm(divorced ~ conflict_frequency,
             family = binomial,
             data = df)
#summary
summary(model)

subset_df <- df[1:20, ]

plot(subset_df$conflict_frequency,
     as.numeric(as.character(subset_df$divorced)),
     main = "Logistic Regression: Divorce vs Conflict Frequency",
     xlab = "Conflict Frequency",
     ylab = "Probability of Divorce",
     col = rgb(0, 0, 0, 0.3),
     pch = 19)

# Sequence of predictor values for prediction curve
x_values <- seq(min(df$conflict_frequency),
                max(df$conflict_frequency),
                length.out = 100)

# Predicted probabilities
predicted_probs <- predict(
  model,
  newdata = data.frame(conflict_frequency = x_values),
  type = "response"
)

# Logistic regression curve
lines(x_values,
      predicted_probs,
      col = "blue",
      lwd = 3)

