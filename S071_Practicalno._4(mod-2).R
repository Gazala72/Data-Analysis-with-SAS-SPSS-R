# Library importing
library(dplyr)
library(psych)

# 1. READ THE CSV FILE
df <- read.csv("penguins.csv")

print("---4. One-Sample t-test----")

# One-sample t-test on numeric column (example: body_mass_g)
t_test_one <- t.test(df$body_mass_g, mu = 4000)   
print(t_test_one)



