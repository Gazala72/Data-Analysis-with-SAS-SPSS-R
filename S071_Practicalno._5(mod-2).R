# ===============================
# Library importing
# ===============================
library(dplyr)

# ===============================
# Read the CSV file
# ===============================
df <- read.csv("Iris - Iris.csv")  
colnames(df)

print("------5. Independent two- sample t-test----")

t_test_two <- t.test(df$SepalLengthCm - df$SepalWidthCm, data = df)

print(t_test_two)



