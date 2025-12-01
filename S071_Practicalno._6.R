# ==========================================
# Pract 6.  Merge and Append
# ==========================================

library(dplyr)  

# ------------------------------------------
# 1. SETUP: Create Two Simple Datasets
# ------------------------------------------
# Dataset 1: FOOD DELIVERY dataset
data_food <- data.frame(
  order_id = c(101, 102, 103),
  distance_km = c(2.5, 4.1, 3.2),
  delivery_time_min = c(25, 35, 30),
  traffic_level = c("Low", "High", "Medium"),
  route_length_km = c(2.8, 4.4, 3.5),
  delivery_mode = c("Bike", "Car", "Bike"),
  weather = c("Clear", "Rainy", "Cloudy"),
  order_time = c("12:30", "14:15", "16:40"),
  restaurant_zone = c("North", "East", "West"),
  customer_zone = c("North", "East", "West")
)

# Dataset 2: SALES dataset
data_sales <- data.frame(
  Product_ID = c(101, 102, 104),
  Sale_Date = c("2024-01-05", "2024-01-08", "2024-01-10"),
  Sales_Rep = c("Amit", "Riya", "Neha"),
  Region = c("North", "East", "South"),
  Sales_Amount = c(1200, 1500, 1800),
  Quantity_Sold = c(5, 8, 10),
  Product_Category = c("Food", "Grocery", "Beverage"),
  Unit_Cost = c(100, 120, 150),
  Unit_Price = c(240, 280, 300),
  Customer_Type = c("Regular", "New", "Regular"),
  Discount = c(10, 5, 15),
  Payment_Method = c("Online", "Cash", "Online"),
  Sales_Channel = c("Store", "Online", "Store"),
  Region_and_Sales_Rep = c("North-Amit", "East-Riya", "South-Neha")
)

print("--- Food Delivery Data ---")
print(data_food)

print("--- Sales Data ---")
print(data_sales)

# ------------------------------------------
# 2. MERGE (Joining Columns)
# ------------------------------------------
# Example: Merge food + sales using matching ID (order_id = Product_ID)
# (Only matching IDs will be merged)

merged_data <- merge(
  data_food,
  data_sales,
  by.x = "order_id",
  by.y = "Product_ID"
)

print("--- Merged Data (Food + Sales) ---")
print(merged_data)

# ------------------------------------------
# 3. APPEND (Stacking Rows)
# ------------------------------------------
# Example: Append new food orders to existing food dataset


final_list <- bind_rows(data_food, new_food_orders)

print("--- Appended Data (Food + New Orders) ---")
print(final_list)

