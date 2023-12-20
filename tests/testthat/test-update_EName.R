# Load datasets by using the following helper function:
df <- get_data("majority")

# Convert pre-2020 electorate names to match name changes that occurred in 2020
df <- update_EName(df, column=Electorate)