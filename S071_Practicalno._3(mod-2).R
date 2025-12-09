# Library importing
library(dplyr)
library(psych)

# 1. READ THE CSV FILE
df <- read.csv("divorce_df.csv")

print("-- 3. Cross-tabulation (education_level vs divorced) --")

cross_tab <- table(df$education_level, df$divorced)

print(cross_tab)

