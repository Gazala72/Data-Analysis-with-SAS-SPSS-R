#library importing 
library(dplyr)
library(psych)

# 1. READ THE CSV FILE
# ================================
df <- read.csv("retail_store_sales.csv") 

print("-------6. Paired t-test-----")

# Creating a related column using existing dataset column
df$Discount_Adjusted <- df$Total.Spent - runif(nrow(df), min = 0, max = 50)

t_test_paired <- t.test(df$Total.Spent, df$Discount_Adjusted, paired = TRUE)

print(t_test_paired)
