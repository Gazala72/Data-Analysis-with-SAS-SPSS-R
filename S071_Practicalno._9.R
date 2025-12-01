# ======================================================================
# 9. practical
# ======================================================================

print("-------S071 Gazala Alam--------")

install.packages("stringr")
install.packages("tidyr")
library(stringr)
library(tidyr)
library(dplyr)

# ======================================================================
# 1. IMPORT DATASET
# ======================================================================
sales <- read.csv("sales_data - sales_data.csv", na.strings = c("", "NA"))

print("--- Original Dataset ---")
print(head(sales))

# ======================================================================
# 2. USING str_sub() (Substring)
# ======================================================================
# Scenario: Extract parts of Product_ID

sales$Category_Code <- str_sub(sales$Product_ID, 1, 4)  
sales$Item_Code     <- str_sub(sales$Product_ID, -4, -1) 

print("--- Data after str_sub() ---")
print(sales %>% select(Product_ID, Category_Code, Item_Code))

# ======================================================================
# 3. USING str_split() (Split String)
# ======================================================================

split_matrix <- str_split(sales$Region_and_Sales_Rep, "-", simplify = TRUE)
sales$Region    <- split_matrix[, 1]
sales$Sales_Rep <- split_matrix[, 2]

print("--- Data after str_split() (Manual Assignment) ---")
print(sales %>% select(Region_and_Sales_Rep, Region, Sales_Rep))

# ======================================================================
# 4. BONUS: The "Tidy" Way (separate)
# ======================================================================
tidy_sales <- sales %>%
  separate(Region_and_Sales_Rep, into = c("Region", "Sales_Rep"), sep = "-")

print("--- Bonus: The 'separate' function (easier splitting) ---")
print(tidy_sales %>% select(Region, Sales_Rep))

