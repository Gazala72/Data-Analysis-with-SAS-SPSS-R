library(dplyr)
library(tidyr)

# Import data
df <- read.csv("sales_dataset.csv", na.strings = c("", "NA")) %>%
  mutate(RecordID = row_number())

print(head(df))

# Pivot Longer: Sales_Amount, Quantity, Discount
long_df <- df %>%
  pivot_longer(
    cols = c(Sales_Amount, Quantity, Discount),
    names_to = "Metric",
    values_to = "Value"
  )

print(head(long_df, 10))

# Pivot Wider: Convert back to wide format
wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print(head(wide_df))

# Region-wise Sales Pivot
region_pivot <- df %>%
  select(RecordID, Region, Sales_Amount) %>%
  pivot_wider(
    names_from = Region,
    values_from = Sales_Amount
  )

print(head(region_pivot))

