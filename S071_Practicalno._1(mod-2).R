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

print("----- 1. DESCRIPTIVE STATISTICS -----\n")

print("Summary of Sales Amount:\n")
summary(df$Sales_Amount)

print("Detailed Description of Quantity Sold:\n")
describe(df$Quantity_Sold)

