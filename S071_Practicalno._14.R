install.packages("lubridate")
install.packages("dplyr")

library(lubridate)
library(dplyr)

# ==============================================================================
# 1. READ THE DATASET
# ==============================================================================

sales_df <- read.csv("sales_data.csv")

print("--- Original Dataset (First 6 Rows) ---")
print(head(sales_df))

# ==============================================================================
# 2. PARSE AND EXTRACT DATE COMPONENTS FROM Sale_Date
# ==============================================================================

processed_sales <- sales_df %>%
  mutate(
    # A. Convert Sale_Date (string) into actual Date format
    Actual_Date = ymd(Sale_Date),
    
    # B. Extract date components
    Year = year(Actual_Date),                   # e.g., 2023
    Month_Num = month(Actual_Date),             # 1–12
    Month_Name = month(Actual_Date, label = TRUE),  # Jan, Feb,...
    Day = day(Actual_Date),                     # 1–31
    Weekday_Num = wday(Actual_Date),            # 1=Sun, 7=Sat
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),  # Monday
    Quarter = quarter(Actual_Date),             # 1–4
    Day_of_Year = yday(Actual_Date)             # 1–366
  )

print("--- Processed Dataset with Extracted Date Components ---")
print(head(processed_sales))

# ==============================================================================
# 3. SYSTEM DATE & TIME (NOW)
# ==============================================================================

current_time <- now()

print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))

