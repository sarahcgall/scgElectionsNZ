#' @title Add New Zealand Regions or Electorate Type to Electorates in a Data Frame
#' @name add_data
#'
#' @description
#' This function enriches a data frame with additional data based on New Zealand electorate names.
#' It dynamically adds specified data types such as regions or electorate types (i.e., "General" or "Maori")
#' as new columns based on the specified `output` type. It utilises internal datasets `region`
#' and `type`, which map electorates to their corresponding regions or types.
#'
#' The function validates the input data frame and specified column. It converts factor
#' columns to character to ensure correct matching. Warnings are issued if the specified
#' column contains `NA` values, or if any electorates cannot be matched. A warning and the
#' original data frame are returned if none of the electorates can be matched.
#'
#' @param data A data frame containing New Zealand electorate information.
#' @param electorateCol Name of the column in `data` containing electorate names.
#'                      Defaults to "Electorate".
#' @param output Type of additional data to append. The options are:
#'               - "region": Adds a "Region" column with New Zealand region.
#'               - "type": Adds an "Electorate_Type" column with electorate types.
#'               Default is "region".
#'
#' @return A data frame identical to `data` but with the additional column appended.
#'         In case of issues like unmatched electorates, the original data frame is returned
#'         with a warning.
#'
#' @examples
#' \dontrun{
#'   data(majority)
#'   df_region <- add_data(majority, output = "region")
#'   df_types <- add_data(majority, output = "type")
#' }
#' @export
add_data <- function(data,
                     electorateCol = "Electorate",
                     output = c("region", "type")
) {
  # ==============================================================#
  # Define a mapping of output types to datasets and column names
  output_mappings <- list(
    region = list(data = region,
                  column_name = "Region",
                  key = "Electorate"),
    type = list(data = type,
                column_name = "Electorate_Type",
                key = "Electorate")
    # Add more mappings here when available
  )
  # ==============================================================#
  # CHECK PARAMS
  # Check Parameters
  check_params(data = data,
               electorateCol = electorateCol)

  # Convert factors to characters
  if (is.factor(data[[electorateCol]])) {
    data[[electorateCol]] <- as.character(data[[electorateCol]])
  }

  # ==============================================================#
  # GET INTERNAL DATASET
  # Get default if no "output" set
  output <- match.arg(output)

  # Retrieve data mappings
  mapping <- output_mappings[[output]]

  # Check internal data
  if (!is.data.frame(mapping$data)) {
    stop(paste("Internal dataset for `", output, "` is missing or not a data frame.", sep = ""))
  }

  # ==============================================================#
  # MERGE DATASETS
  # Add new column to dataset by Electorate
  df <- merge(x = data,
              y = mapping$data,
              by.x = electorateCol,
              by.y = mapping$key,
              all.x = TRUE)

  # ==============================================================#
  # RETURN DATA FRAME
  # If all NAs are present, return original dataset
  if (all(is.na(df[[mapping$column_name]]))) {
    warning(paste0("Returning original `data`. Ensure that `", electorateCol, "` contains electorate names to be matched."))
    return(data)

  } else if (any(is.na(df[[mapping$column_name]]))) { # or give warning if some NAs are present
    warning(paste("New column, `", mapping$column_name, "`, contains NAs. Ensure that `", electorateCol, "` contains no NAs.", sep = ""))
    return(df)

  } else # return new dataset with the new column added
    return(df)
}