install.packages("dplyr")
library(dplyr)
library(readr)   # For fast CSV reading

# Load dataset
aubank <- read_csv("Aubank.csv")

# Quick look
head(aubank)

# -------------------------------------------------------------
# Method 1 : Using subset()  (Base R)
# -------------------------------------------------------------

# Example 1 — Single Condition
# Days where Closing Price > 900
close_gt_900 <- subset(aubank, Close > 900)
cat("Days with Close > 900:", nrow(close_gt_900), "\n")
summary(close_gt_900$Close)

# Example 2 — Multiple Conditions (AND)
# Days where Close > 900 AND Volume > 1,000,000
close_vol_subset <- subset(aubank, Close > 900 & Volume > 1000000)
cat("Days with Close > 900 & Volume > 1,000,000:", nrow(close_vol_subset), "\n")
head(close_vol_subset)

# Example 3 — Multiple Conditions (OR)
# Days where High > 930 OR Low < 880
volatile_days <- subset(aubank, High > 930 | Low < 880)
cat("Days with High > 930 OR Low < 880:", nrow(volatile_days), "\n")
head(volatile_days)


# -------------------------------------------------------------
# Method 2 : Using filter() (dplyr / Tidyverse)
# -------------------------------------------------------------

# Example 1 — Single Condition (Pipe Operator)
# Days where Open < 900
open_lt_900 <- aubank |>
  filter(Open < 900)
cat("Days with Open < 900:", nrow(open_lt_900), "\n")
summary(open_lt_900$Open)

# Example 2 — Multiple Conditions (Comma = AND)
# Days where Adj Close > 910 AND Volume < 600,000
adj_high_low_vol <- aubank |>
  filter(`Adj Close` > 910, Volume < 600000)
cat("Days with Adj Close > 910 & Volume < 600,000:", nrow(adj_high_low_vol), "\n")
head(adj_high_low_vol)

# Example 3 — Values in a Set (%in%)
# Days where High is either 908 or 920
high_specific <- aubank |>
  filter(High %in% c(908, 920))
cat("Days where High = 908 or 920:", nrow(high_specific), "\n")
table(high_specific$High)


# -------------------------------------------------------------
# Method 3 : Advanced (Filter + Select + Arrange + Summary)
# -------------------------------------------------------------

# Example 1 — Filter + Select specific columns
high_close_selected <- aubank |>
  filter(Close > 900) |>
  select(Date, High, Low, Close, Volume)
cat("\nHigh Close days (selected columns):\n")
head(high_close_selected)

# Example 2 — Sort data by descending Volume
sorted_by_volume <- aubank |>
  arrange(desc(Volume))
cat("\nHighest Volume Days:\n")
head(sorted_by_volume)

# Example 3 — Combined: Filter + Sort + Select
elite_days <- aubank |>
  filter(High > 920) |>
  arrange(desc(Close)) |>
  select(Date, High, Close, Volume)
cat("\nElite days (High > 920 sorted by Close):\n")
head(elite_days)

# Example 4 — Summary for conditions
adj_summary <- aubank |>
  filter(`Adj Close` > 900) |>
  summarise(
    count = n(),
    avg_close = mean(Close),
    max_close = max(Close),
    min_close = min(Close)
  )
cat("\nSummary of days with Adj Close > 900:\n")
print(adj_summary)

