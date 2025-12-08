#Practical_no_12

data(iris)

# Load custom flower dataset
flower_df <- read.csv("flower_dataset - flower_dataset.csv")

# Preview column names
print("--- Data Structure Before Transformation ---")
print("Iris columns:")
print(names(iris))          # Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species
print("Flower dataset columns:")
print(names(flower_df))     # species, height_cm, etc.

#DATA PREPARATION (Aligning Columns)

# Prepare Iris Data
# Assume 'Sepal.Length' represents 'Height'

iris_clean <- iris[, c("Species", "Sepal.Length")]
names(iris_clean) <- c("Species", "Height")
iris_clean$Height <- as.numeric(iris_clean$Height)  # Ensure numeric

#Prepare Flower Data

flower_clean <- flower_df[, c("species", "height_cm")]
names(flower_clean) <- c("Species", "Height")
flower_clean$Height <- as.numeric(flower_clean$Height)  

#VERTICAL COMBINATION (rbind)

combined_data <- rbind(iris_clean, flower_clean)

#RESULTS
print("--- Combined Data Summary ---")
print(paste("Iris rows:", nrow(iris_clean)))
print(paste("Flower rows:", nrow(flower_clean)))
print(paste("Total rows (Expected):", nrow(iris_clean) + nrow(flower_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data))  
print(tail(combined_data))  

