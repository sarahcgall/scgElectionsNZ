# Load datasets by using the following helper function:
df <- scgUtils::get_data("majority")

test_that("correct error is returned", {
  expect_error(add_type(df, "invalid_column"),
               "Ensure that you have created a column with the 'Electorate'.")
})

test_that("function adds an electorate type column to the dataset", {
  x <- add_type(df)
  expect_equal("Electorate_Type" %in% names(x),TRUE)
})
