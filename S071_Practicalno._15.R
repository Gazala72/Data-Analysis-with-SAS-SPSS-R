
# Load libraries
library(dplyr)

# ==============================================================================
# 1. LOAD THE DATASET
# ==============================================================================

sales_df <- read.csv("sales_data.csv")

print("--- Data Loaded from sales_data.csv ---")
head(sales_df)

# ==============================================================================
# 2. USING str() – Structure of Data
# ==============================================================================

print("--- OUTPUT OF str() ---")
str(sales_df)
# Shows:
# - rows & columns count
# - data types (int, chr, num)
# - first few values of each column

# ==============================================================================
# 3. USING summary() – Statistical Summary
# ==============================================================================

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(sales_df)
# Shows:
# - Numeric: Min, Mean, Median, Max
# - Character: Length + Class only (not very useful)
# - Logical: TRUE/FALSE counts

# ==============================================================================
# 4. IMPROVING summary() BY CONVERTING CATEGORICAL COLUMNS TO FACTORS
# ==============================================================================

# Convert categorical columns to factor for better summaries
sales_df$Region <- as.factor(sales_df$Region)
sales_df$Product_Category <- as.factor(sales_df$Product_Category)
sales_df$Sales_Rep <- as.factor(sales_df$Sales_Rep)
sales_df$Customer_Type <- as.factor(sales_df$Customer_Type)
sales_df$Payment_Method <- as.factor(sales_df$Payment_Method)
sales_df$Sales_Channel <- as.factor(sales_df$Sales_Channel)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(sales_df)
# Now summary() will show:
# - Region counts
# - Product Category counts
# - Customer Type counts
# - Payment method counts
# - etc.

# ==============================================================================
# 5. Accessing Specific Summary Values
# ==============================================================================

avg_sales <- mean(sales_df$Sales_Amount, na.rm = TRUE)
max_sales <- max(sales_df$Sales_Amount, na.rm = TRUE)
total_quantity <- sum(sales_df$Quantity_Sold, na.rm = TRUE)

print(paste("Average Sales Amount:", avg_sales))
print(paste("Maximum Sales Amount:", max_sales))
print(paste("Total Quantity Sold:", total_quantity))

