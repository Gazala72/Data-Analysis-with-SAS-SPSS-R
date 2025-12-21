# Load required library
library(dplyr)

# Read the dataset
medical <- read.csv("medical_cost_prediction_dataset.csv")

# One-Way ANOVA
anova_one_way <- aov(annual_medical_cost ~ city_type, data = medical)

# Store ANOVA result
res <- summary(anova_one_way)

# Display ANOVA table
print(res)

# Extract p-value (CORRECT way)
p_val <- res[[1]][["Pr(>F)"]][1]

# Print hypotheses
cat("\nNull Hypothesis (H0): Mean annual medical cost is same across city types\n")
cat("Alternate Hypothesis (H1): Mean annual medical cost differs across city types\n\n")

# Print p-value
cat("P-value:", p_val, "\n\n")

# Decision
if (p_val < 0.05) {
  cat("Decision: Reject H0 and Accept H1\n")
  cat("Reason: p-value < 0.05, difference is statistically significant\n")
} else {
  cat("Decision: Accept H0 and Reject H1\n")
  cat("Reason: p-value >= 0.05, no significant difference found\n")
}

