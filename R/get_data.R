#' get_data
#'
#' \code{\link{get_data}} is a helper function for loading datasets and specifying your own name.
#'
#' @param ... Name of dataset. Available datasets include:
#'   \code{majority}, \code{summary}, \code{seats}, \code{party_votes}, \code{split_total},
#' @return A data frame.
#' @export
#' @examples
#' df <- get_data("majority")
get_data <- function(...) {
    e <- new.env()
    name <- utils::data(..., envir = e)[1]
    e[[name]]
}
