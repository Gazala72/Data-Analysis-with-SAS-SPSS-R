# ======================================================================
# 10. Creating New Variables using Transformations & Calculations in R
# Dataset: Sales Data
# ======================================================================

print("--------------- S071 Gazala Alam -----------------------")

library(dplyr)
library(tidyr)

# ======================================================================
# 1. IMPORT DATASET
# ======================================================================

sales <- read.csv("sales_data - sales_data.csv", na.strings = c("", "NA"))

sales_clean <- sales %>%
  mutate(
    Sales_Amount   = replace_na(Sales_Amount, 0),
    Quantity_Sold  = replace_na(Quantity_Sold, 0),
    Unit_Cost      = replace_na(Unit_Cost, 0),
    Unit_Price     = replace_na(Unit_Price, 0),
    Discount       = replace_na(Discount, 0)
  )

print("--- Cleaned Baseline Data ---")
print(head(sales_clean))

# ======================================================================
# 2. METHOD A: ARITHMETIC CALCULATIONS
# ======================================================================
# Example: Calculate total revenue AFTER discount
# Formula:
# Gross = Unit_Price * Quantity_Sold
# Discount_Amount = Gross * (Discount/100)
# Net_Revenue = Gross - Discount_Amount

sales_calc <- sales_clean %>%
  mutate(
    Gross_Amount     = Unit_Price * Quantity_Sold,
    Discount_Amount  = Gross_Amount * (Discount / 100),
    Net_Revenue      = Gross_Amount - Discount_Amount
  )

print("--- Method A: Arithmetic Results (Net Revenue) ---")
print(sales_calc %>% select(Unit_Price, Quantity_Sold, Discount, Net_Revenue))

# ======================================================================
# 3. METHOD B: CONDITIONAL LOGIC (ifelse)
# ======================================================================
# Example:
# If Sales_Amount > 10000 → "High Value Sale" else "Normal Sale"
# If Discount > 20% → "High Discount", else "Low Discount"

sales_logic <- sales_clean %>%
  mutate(
    Sale_Type = ifelse(Sales_Amount > 10000, "High Value Sale", "Normal Sale"),
    Discount_Level = ifelse(Discount > 20, "High Discount", "Low Discount")
  )

print("--- Method B: Logic Results (Labels) ---")
print(sales_logic %>% select(Sales_Amount, Sale_Type, Discount, Discount_Level))

# ======================================================================
# 4. METHOD C: TEXT TRANSFORMATION (paste)
# ======================================================================
# Create a readable sales summary

sales_text <- sales_clean %>%
  mutate(
    Sales_Summary = paste(
      "Product", Product_ID,
      "sold by", Sales_Rep,
      "in", Region,
      "for ₹", Sales_Amount
    )
  )

print("--- Method C: Text Transformation ---")
print(head(sales_text$Sales_Summary))

# ======================================================================
# 5. ALL TOGETHER (Final Workflow)
# ======================================================================

final_sales <- sales_clean %>%
  mutate(
    Net_Revenue = (Unit_Price * Quantity_Sold) - 
      ((Unit_Price * Quantity_Sold) * Discount / 100),
    High_Value = ifelse(Net_Revenue > 15000, TRUE, FALSE),
    Report = paste0("Rep: ", Sales_Rep, " | Dis: ", Discount, "%")
  )

print("--- Final Combined Dataset ---")
print(head(final_sales))

