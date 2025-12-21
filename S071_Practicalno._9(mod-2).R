# Load required library
library(dplyr)

# Read the dataset
context <- read.csv("context_master.csv")

# Create contingency table
tbl <- table(context$GENDER, context$ROLE)

# Chi-Square test
chi <- chisq.test(tbl)

# Print hypotheses
cat("\nNull Hypothesis (H0): Gender and role are independent\n")
cat("Alternate Hypothesis (H1): Gender and role are associated\n\n")

# Print p-value
cat("P-value:", chi$p.value, "\n\n")

# Decision
if (chi$p.value < 0.05) {
  cat("Decision: Reject H0 and Accept H1\n")
  cat("Reason: p-value < 0.05, variables are associated\n")
} else {
  cat("Decision: Accept H0 and Reject H1\n")
  cat("Reason: p-value >= 0.05, variables are independent\n")
}

