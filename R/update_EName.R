#' Update Electorate Names
#'
#' Comvert previous electorate names to the 2020 boundary names.
#'
#' @param data Name of dataset
#' @param column1 Name of column with electorates
#' @param column2 Name of column with election years
#' @return A data frame with an additional region column.
#' @export
#' @importFrom rlang :=
#' @examples
#' add_region(majority)
update_EName <- function(data,
                         column1=Electorate,
                         column2=Election)
{
  if (missing(data) || !is.data.frame(data))
    stop("A data frame is required to be parsed through this function.")

  df <- dplyr::mutate(data, {{ column1 }} := dplyr::case_when(
    # 2020 changes
    {{ column1 }} == "Helensville" ~ "Kaipara ki Mahurangi",
    {{ column1 }} == "Rodney" ~ "Whangaparaoa",
    {{ column1 }} == "Manukau East" ~ "Panmure-Otahuhu",
    {{ column1 }} == "Flat Bush" ~ "Takanini",
    {{ column1 }} == "Hunua" & !{{ column2 }} %in% c(1996, 1999) ~ "Port Waikato",
    {{ column1 }} == "Rimutaka" ~ "Remutaka",
    {{ column1 }} == "Port Hills" ~ "Banks Peninsula",
    {{ column1 }} == "Dunedin North" ~ "Dunedin",
    {{ column1 }} == "Dunedin South" ~ "Taieri",
    {{ column1 }} == "Clutha-Southland" ~ "Southland",
    # NB Takanini = new electorate in South Auckland
    # pre 2020 changes
    {{ column1 }} == "Albany" ~ "East Coast Bays",
    {{ column1 }} == "Aoraki" ~ "Rangitata",
    {{ column1 }} == "Hunua" & {{ column2 }} %in% c(1996, 1999) ~ "Papakura",
    {{ column1 }} == "Clevedon" ~ "Papakura",
    {{ column1 }} %in% c("Karapiro", "Piako") ~ "Waikato",
    {{ column1 }} == "Mahia" ~ "East Coast",
    {{ column1 }} == "Otago" ~ "Waitaki",
    {{ column1 }} == "Owairaka" ~ "Mt Albert",
    {{ column1 }} == "Rakaia" ~ "Selwyn",
    {{ column1 }} == "Titirangi" ~ "New Lynn",
    # NB Waipareira merged with Waitakere in 1999 then Waitakere splits into Kelston and Upper Harbour
    # NB Botany = new electorate in 2008
    .default = {{ column1 }}
  ))

  if (is.null(df)) return(data) else return(df)

}
