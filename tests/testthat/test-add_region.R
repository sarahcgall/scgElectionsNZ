# Load datasets by using the following helper function:
df <- scgUtils::get_data("majority")

test_that("correct error is returned", {
  expect_error(add_region(df, "invalid_column"),
               "Ensure that you have created a column with the 'Electorate'.")
})

test_that("function adds a region column to the dataset", {
  x <- add_region(df)
  expect_equal("Region" %in% names(x),TRUE)
})
