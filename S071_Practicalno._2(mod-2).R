#library importing 
library(dplyr)
library(psych)

# 1. READ THE CSV FILE
# ================================
df <- read.csv("shopping_behavior_updated.csv")  

# Print header
print("----2. Frequency Table (Review Rating Distribution) ---")

# ---- A. Using table() ----
rating_counts <- table(df$Review.Rating)
print(rating_counts)

# ---- B. Using dplyr count() ----
rating_df <- df %>% count(Review.Rating)
print(rating_df)

