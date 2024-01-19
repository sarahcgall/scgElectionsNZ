test_that("error message correctly returned", {
  expect_error(update_names("df"), "Parameter `data` is required and must be a data frame.")
})

test_that("converts pre-2020 electorate names to match name changes that occurred in 2020", {
  data("majority")
  expect_error(update_names(majority, "invalid_column"),
               "`nameCol` with value `invalid_column` must be a column in `data`.")

  x <- update_names(majority, nameCol = "Electorate", output="electorate")
  expect_length(x, 7)

  # testing change for 2020 Flat Bush to Takanini
  expect_equal(nrow(x[x$Election == 2020 & x$Electorate == "Takanini",]), 1)

  # testing change for 1999 Hunua Papakura
  expect_equal(nrow(x[x$Election == 1999 & x$Electorate == "Papakura",]), 1)

  # testing change for 1999 Hunua to Port Waikato
  expect_equal(nrow(x[x$Election == 1999 & x$Electorate == "Port Waikato",]), 1)
})

test_that("converts party names to match successful parties only", {
  data("party_votes")
  x <- update_names(party_votes)

  # testing change for 2023 Flat Bush to Takanini
  expect_equal("National Party" %in% x$Party[x$Election == 2023], TRUE)

  # testing change for 1999 Hunua Papakura
  expect_equal("Other" %in% x$Party[x$Election == 2023], TRUE)

  # testing change for 1999 Hunua to Port Waikato
  expect_equal("Freedom NZ" %in% x$Party[x$Election == 2023], FALSE)
})
