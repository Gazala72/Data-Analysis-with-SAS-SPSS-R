# Install required packages
install.packages("dplyr")
install.packages("psych")

# Load libraries
library(dplyr)
library(psych)

# ================================
# 1. READ THE CSV FILE
# ================================
df <- read.csv("sales_data.csv")  

# ================================
# 2. CREATE A NEW COLUMN
# ================================
# Example: If you want to categorize Sales_Amount into High/Low
df$Sales_Group <- ifelse(df$Sales_Amount > 80, "High", "Low")

# ================================
# 3. DESCRIPTIVE STATISTICS
# ================================

cat("----- 1. DESCRIPTIVE STATISTICS -----\n")

cat("Summary of Sales Amount:\n")
print(summary(df$Sales_Amount))

cat("\nDetailed Description of Quantity Sold:\n")
print(describe(df$Quantity_Sold))

