# Load datasets by using the following helper function:
df <- get_data("majority")

# Add a electorate type column to dataset
df <- add_type(df)

# Test error
add_type(df1)
