# Load datasets by using the following helper function:
data("majority")

test_that("correct error is returned", {
  expect_error(add_data("invalid_df"),
               "Parameter `data` is required and must be a data frame.")
  expect_error(add_data(majority, "invalid_column"),
               "`electorateCol` with value `invalid_column` must be a column in `data`.")
})

test_that("function adds a region column to the dataset and correctly merges", {
  x <- add_data(majority)
  expect_equal("Region" %in% names(x), TRUE)
  expect_equal(x$Region[x$Electorate == "Auckland Central"][1], "Auckland")
})

test_that("function adds a type column to the dataset and correctly merges", {
  x <- add_data(majority, output="type")
  expect_equal("Electorate_Type" %in% names(x), TRUE)
  expect_equal(x$Electorate_Type[x$Electorate == "Auckland Central"][1], "General")
})

test_that("function adds a region column to the dataset if electorateCol values are factors", {
  x <- majority
  x$Electorate <- as.factor(x$Electorate)
  x <- add_data(x)
  expect_equal("Region" %in% names(x), TRUE)
  expect_equal(is.character(x$Electorate), TRUE)
})

test_that("function returns warning and original data if electorateCol values are NA", {
  x <- majority
  x$Electorate <- NA
  expect_warning(add_data(x),
                 "Returning original `data`. Ensure that `Electorate` contains electorate names to be matched.")
  expect_equal(suppressWarnings(add_data(x)), x)
})

test_that("function returns warning and original data if electorateCol contains some NAs", {
  x <- majority
  x$Electorate[x$Electorate == "Auckland Central"] <- NA
  expect_warning(add_data(x),
                 "New column, `Region`, contains NAs. Ensure that `Electorate` contains no NAs.")
  expect_warning(add_data(x, output="type"),
                 "New column, `Electorate_Type`, contains NAs. Ensure that `Electorate` contains no NAs.")
  expect_equal("Region" %in% names(suppressWarnings(add_data(x))), TRUE)
  expect_equal("Electorate_Type" %in% names(suppressWarnings(add_data(x, output="type"))), TRUE)
})

test_that("function returns warning and original data", {
  expect_warning(add_data(majority,"Election"),
                 "Returning original `data`. Ensure that `Election` contains electorate names to be matched.")
  expect_warning(add_data(majority,"Election", "type"),
                 "Returning original `data`. Ensure that `Election` contains electorate names to be matched.")
  expect_equal(suppressWarnings(add_data(majority, "Election")), majority)
  expect_equal(suppressWarnings(add_data(majority, "Election", "type")), majority)
})

test_that("function handles empty data frame", {
  empty_df <- data.frame(Electorate = character())
  expect_warning(add_data(empty_df), "Returning original `data`.")
  expect_equal(suppressWarnings(add_data(empty_df)), empty_df)
})

test_that("function handles data frame with no matching keys", {
  no_match_df <- data.frame(Electorate = "Nonexistent Electorate")
  expect_warning(add_data(no_match_df), "Returning original `data`.")
  expect_equal(suppressWarnings(add_data(no_match_df)), no_match_df)
})

