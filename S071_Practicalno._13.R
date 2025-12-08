library(dplyr)


# 1. READ THE DATASET

# Change this to your file path
sales_df <- read.csv("sales_data.csv")

print("--- 1. Original Dataset Loaded from CSV ---")
print(head(sales_df))

# ==============================================================================
# 2. IDENTIFYING DUPLICATES (Before Removing Them)
# ==============================================================================

duplicates_report <- sales_df %>%
  group_by(Product_ID, Sale_Date, Sales_Rep, Region, Sales_Amount,
           Quantity_Sold, Product_Category, Unit_Cost, Unit_Price,
           Customer_Type, Discount, Payment_Method, Sales_Channel,
           Region_and_Sales_Rep) %>%
  count() %>%            # Count how many times each row appears
  filter(n > 1)          # Keep only duplicates

print("--- 2. Duplicate Rows Detected ---")
print(duplicates_report)

# ==============================================================================
# 3. HANDLING DUPLICATES: Remove EXACT Matches
# ==============================================================================

clean_exact <- sales_df %>%
  distinct()             # Removes perfectly identical rows

print("--- 3. Dataset After Removing Exact Duplicates ---")
print(clean_exact)

# ==============================================================================
# 4. HANDLING DUPLICATES by SPECIFIC COLUMN
# Example: Keep only UNIQUE Sales_Rep (drop repeated reps)
# ==============================================================================

unique_sales_rep <- sales_df %>%
  distinct(Sales_Rep, .keep_all = TRUE)

print("--- 4. Unique Sales Rep (All columns kept, duplicates removed) ---")
print(unique_sales_rep)

