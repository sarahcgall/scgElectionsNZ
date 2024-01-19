# pre-MMP Results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# Upload raw data from pre-1994
preMMP_results <- read.csv("data-raw/vote-data/pre-1994/1890-1993-results.csv")

# Change first column name is Election
names(preMMP_results)[1] <- "Election"

# Make Election column numeric amd amend party names
preMMP_results1 <- preMMP_results %>%
  amend_parties(Party) %>% # Amend party names
  mutate(Election = as.numeric(Election))

# Save to .rds
usethis::use_data(preMMP_results, overwrite = TRUE)