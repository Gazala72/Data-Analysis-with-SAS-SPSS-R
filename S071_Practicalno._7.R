# Selecting and dropping variables using select()

print("--- S071 Gazala Alam  ---")

library(dplyr)

# Import dataset

food <- read.csv("Food_Delivery_Route_Efficiency_Dataset.csv")
print("--- Original Dataset (First 3 rows) ---")
print(head(food, 3))

# ------------------------------
# Selecting columns
# ------------------------------

# Select specific columns
selected_cols <- food %>% select(order_id, distance_km, delivery_time_min)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# Select a range of columns
range_cols <- food %>% select(distance_km:traffic_level)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

# Select columns starting with "d"
starts_with_d <- food %>% select(starts_with("d"))

print("--- Selected columns starting with 'd' ---")
print(head(starts_with_d, 3))

# ------------------------------
# Dropping columns
# ------------------------------

# Drop one column
dropped_one <- food %>% select(-weather)

print("--- Dataset with 'weather' dropped ---")
print(names(dropped_one))

# Drop multiple columns
dropped_multiple <- food %>% select(-restaurant_zone, -customer_zone)

print("--- Dataset with 'restaurant_zone' and 'customer_zone' dropped ---")
print(names(dropped_multiple))

# Drop a range of columns
dropped_range <- food %>% select(-(delivery_time_min:delivery_mode))

print("--- Dataset with range 'delivery_time_min' to 'delivery_mode' dropped ---")
print(names(dropped_range))
