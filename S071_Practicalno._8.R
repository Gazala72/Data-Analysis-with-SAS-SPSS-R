# ======================================================================
# R Script: Handling Missing Values (Food Delivery Dataset)
# ======================================================================

print("--- S071 Gazala Alam  ---")

install.packages("tidyr")   
# Load libraries
library(dplyr)
library(tidyr)

# ======================================================================
# 1. IMPORT DATA
# ======================================================================
food <- read.csv("Food_Delivery_Route_Efficiency_Dataset.csv",
                 na.strings = c("", "NA"))

print(head(food))                 # Original data (first 6 rows)
print(colSums(is.na(food)))       # Count missing values per column

# ======================================================================
# 2. METHOD A: REMOVE MISSING VALUES
# ======================================================================
clean_omit <- na.omit(food)
print(paste("Original rows:", nrow(food)))
print(paste("Rows after na.omit:", nrow(clean_omit)))
print(head(clean_omit))

# ======================================================================
# 3. METHOD B: REPLACE MISSING VALUES
# ======================================================================
avg_time <- mean(food$delivery_time_min, na.rm = TRUE)
avg_dist <- mean(food$distance_km, na.rm = TRUE)

clean_replace <- food %>%
  replace_na(list(
    traffic_level = "Unknown",
    delivery_mode = "Not specified",
    weather = "Clear",
    delivery_time_min = avg_time,
    distance_km = avg_dist
  ))

print(head(clean_replace))        # Data after replacing missing values
print(colSums(is.na(clean_replace))) # Remaining missing values

