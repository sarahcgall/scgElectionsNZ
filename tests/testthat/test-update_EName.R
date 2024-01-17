# Load datasets by using the following helper function:
df <- scgUtils::get_data("majority")

test_that("error message correctly returned", {
  expect_error(update_EName("df"), "A data frame is required to be parsed through this function.")
})

test_that("converts pre-2020 electorate names to match name changes that occurred in 2020", {
  x <- update_EName(df)
  expect_length(x, 7)

  # testing change for 2020 Flat Bush to Takanini
  expect_equal(nrow(x[x$Election == 2020 & x$Electorate == "Takanini",]), 1)

  # testing change for 1999 Hunua Papakura
  expect_equal(nrow(x[x$Election == 1999 & x$Electorate == "Papakura",]), 1)

  # testing change for 1999 Hunua to Port Waikato
  expect_equal(nrow(x[x$Election == 1999 & x$Electorate == "Port Waikato",]), 1)
})

#
