#' New Zealand Electorate Types
#'
#' Add New Zealand electorate types to electorates in a data frame.
#'
#' @param ... Data frame to have electorate type column added to
#' @param column Name of column to be joined (default = "Electorate")
#' @return A data frame with an additional type column.
#' @export
#' @examples
#' add_type(majority)
add_type <- function(..., column="Electorate") {
  if (!column %in% colnames(...))
    stop("Ensure that you have created an column with the 'Electorate'.")

  df <- dplyr::left_join(..., type, by=column)

  if (is.null(df)) return(...)

  df
}