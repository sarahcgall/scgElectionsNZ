#' New Zealand Regions
#'
#' Add New Zealand Regions to electorates in a data frame.
#'
#' @param data Data frame to have region column added to
#' @param column Name of column to be joined (default = "Electorate")
#' @return A data frame with an additional region column.
#' @export
#' @examples
#' head(add_region(majority))
add_region <- function(data,
                       column="Electorate")
{
  if (!column %in% names(data))
    stop("Ensure that you have created a column with the 'Electorate'.")

  df <- dplyr::left_join(data, regions, by=column)

  if (is.null(df)) return(data) else return(df)

}
