install.packages("dplyr")    # run only once
library(dplyr)
library(readr)

aubank <- read_csv("Aubank.csv")

# Example 1 — Sort by Close (ascending)
aubank_sorted_close <- aubank |>
  arrange(Close)
head(aubank_sorted_close, 5)

# Example 2 — Sort by Volume (descending)
aubank_sorted_volume_desc <- aubank |>
  arrange(desc(Volume))
head(aubank_sorted_volume_desc, 5)

# Example 3 — Sort by Date (ascending) then Close (descending)
aubank_multi_sort <- aubank |>
  arrange(Date, desc(Close))
head(aubank_multi_sort, 10)

# Example 4 — Filter + Sort
high_sorted_low <- aubank |>
  filter(High > 920) |>     # filter first
  arrange(Low)              # then sort
cat("Top 5 high-price days sorted by Low:\n")
print(high_sorted_low |> select(Date, High, Low, Close) |> head(5))
