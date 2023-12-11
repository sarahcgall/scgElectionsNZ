#' Update Electorate Names
#'
#' Comvert previous electorate names to the 2020 boundary names.
#'
#' @param ... Name of dataset
#' @param column Name of column with electorates
#' @return A data frame with an additional region column.
#' @export
#' @importFrom rlang :=
#' @examples
#' add_region(majority)
update_EName <- function(..., column=Electorate) {
  if (missing(...))
    stop("A data frame is required to be parsed through this function.")

  df <- dplyr::mutate(..., {{ column }} := dplyr::case_when(
    {{ column }} == "Helensville" ~ "Kaipara ki Mahurangi",
    {{ column }} == "Rodney" ~ "Whangaparaoa",
    {{ column }} == "Manukau East" ~ "Panmure-Otahuhu",
    {{ column }} == "Flat Bush" ~ "Takanini",
    {{ column }} == "Hunua" ~ "Port Waikato",
    {{ column }} == "Rimutaka" ~ "Remutaka",
    {{ column }} == "Port Hills" ~ "Banks Peninsula",
    {{ column }} == "Dunedin North" ~ "Dunedin",
    {{ column }} == "Dunedin South" ~ "Taieri",
    {{ column }} == "Clutha-Southland" ~ "Southland",
    .default = {{ column }}
  ))

  if (is.null(df)) return(...)

  df
}
