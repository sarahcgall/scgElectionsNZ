#' @title Update Electorate or Party Names in a Dataset
#' @name update_names
#'
#' @description
#' This function standardises names in a dataset according to the specified output type:
#' - For "electorate" output, it updates electorate names to align with the most recent boundary changes,
#'   facilitating consistent analysis across various election years.
#' - For "party" output, it modifies party names to denote successful parties, labeling all unsuccessful
#'   parties as "Other". This simplification aids in clear and concise visualisation and analysis.
#' The function is particularly useful for preparing election data for comparative and visual analysis.
#'
#' @param data A data frame containing election-related information.
#' @param nameCol The name of the column in `data` that contains names to be updated.
#'                If NULL, defaults to "Party" for output "party" and "Electorate" for output "electorate".
#' @param yearCol The name of the column in `data` that contains the election years.
#'                This column must be numeric or convertible to numeric.
#' @param output The type of names to be updated; either "party" or "electorate".
#'               Defaults to "party".
#'
#' @return A data frame with updated names in the specified `nameCol`.
#'
#' @examples
#' \dontrun{
#'   data(majority)
#'   updated_majority <- update_names(majority, output = "electorate")
#'   updated_party_votes <- update_names(party_votes, output = "party")
#' }
#' @export
update_names <- function(data,
                         nameCol = NULL,
                         yearCol = "Election",
                         output = c("party", "electorate")
) {
  # ==============================================================#
  # Define mapping
  output_mappings <- list(
    party = list(data = party,
                 new_name = "new_name",
                 old_name = "Party",
                 year = "Election"),
    electorate = list(data = electorate,
                new_name = "new_name",
                old_name = "Electorate",
                year = "Election")
    # Add more mappings here when available
  )

  # Set default for nameCol based on output
  if (is.null(nameCol)) {
    if (match.arg(output) == "party") {
      nameCol <- "Party"
    } else if (match.arg(output) == "electorate") {
      nameCol <- "Electorate"
    }
  }
  # ==============================================================#
  # CHECK PARAMS
  # Check Parameters
  check_params(data = data,
               nameCol = nameCol,
               yearCol = yearCol)

  # Convert factors to characters
  if (is.factor(data[[nameCol]])) {
    data[[nameCol]] <- as.character(data[[nameCol]])
  }

  # Ensure yearCol is numeric
  if (!is.numeric(data[[yearCol]])) {
    data[[yearCol]] <- as.numeric(as.character(data[[yearCol]]))
  }

  # Check if conversion was successful
  if (all(is.na(data[[yearCol]]))) {
    stop("Conversion of `yearCol` to numeric resulted in NA values. Please check the input data.")
  }

  # ==============================================================#
  # GET INTERNAL DATA
  # Retrieve function
  mapping <- output_mappings[[match.arg(output)]]

  # ==============================================================#
  # UPDATE NAMES
  update_row <- function(old_name, year) {
    # Find the matching row
    match_row <- mapping$data[mapping$data[[mapping$old_name]] == old_name & mapping$data[[mapping$year]] == year, ]

    # If a match is found, return the new party name, else return the old party name
    if (nrow(match_row) > 0) {
      return(match_row[[mapping$new_name]])
    } else {
      return(old_name)
    }
  }

  # Apply the update_row function to each row of the data
  data[[nameCol]] <- mapply(update_row, data[[nameCol]], data[[yearCol]])

  # ==============================================================#
  # RETURN DATA FRAME
  return(data)

}
