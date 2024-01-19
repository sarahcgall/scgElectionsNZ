# Helper functions

# Function to check parameters:
check_params <- function(data, ...) {
  # Check for common mandatory parameters
  if (!is.data.frame(data)) {
    stop("Parameter `data` is required and must be a data frame.")
  }

  # Check parameters are in data frame and are in the correct format
  params <- list(...)
  for (name in names(params)) {
    value <- params[[name]]

    if (!all(value %in% names(data))) {
      stop(paste0("`", name, "` with value `", value, "` must be a column in `data`."))
    }
  }
}
