#' New Zealand Regions
#'
#' Add New Zealand Regions to electorates in a data frame.
#'
#' @param ... Data frame to have region column added to
#' @param column Name of column to be joined (default = "Electorate")
#' @return A data frame with an additional region column.
#' @export
#' @examples
#' add_region(majority) %>%
#'   head(n=10)
add_region <- function(..., column="Electorate") {
  if (!column %in% colnames(...))
    stop("Ensure that you have created an column with the 'Electorate'.")

  df <- dplyr::left_join(..., regions, by=column)

  if (is.null(df)) return(...)

  df
}
