# Load required library
library(dplyr)

# Read the dataset
qol <- read.csv("Updated Quality of Life Data.csv")

# Two-Way ANOVA
anova_two_way <- aov(age_at_death ~ gender * occupation_type, data = qol)

# Store result
res <- summary(anova_two_way)

# Display ANOVA table
print(res)

# Extract p-values
p_gender <- res[[1]][["Pr(>F)"]][1]
p_occupation <- res[[1]][["Pr(>F)"]][2]
p_interaction <- res[[1]][["Pr(>F)"]][3]

# Print hypotheses
cat("\nH01: Gender has no effect on age at death\n")
cat("H02: Occupation type has no effect on age at death\n")
cat("H03: No interaction effect between gender and occupation type\n\n")

# Print p-values
cat("P-values:\n")
cat("Gender:", p_gender, "\n")
cat("Occupation:", p_occupation, "\n")
cat("Interaction:", p_interaction, "\n\n")

# Decisions
if (p_gender < 0.05) {
  cat("Decision (Gender): Reject H01\n")
} else {
  cat("Decision (Gender): Accept H01\n")
}

if (p_occupation < 0.05) {
  cat("Decision (Occupation): Reject H02\n")
} else {
  cat("Decision (Occupation): Accept H02\n")
}

if (p_interaction < 0.05) {
  cat("Decision (Interaction): Reject H03\n")
} else {
  cat("Decision (Interaction): Accept H03\n")
}

