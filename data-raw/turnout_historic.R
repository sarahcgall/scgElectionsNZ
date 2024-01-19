# Historic Turnout
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# Upload raw data from pre-1994
turnout_historic <- read.csv("data-raw/vote-data/pre-1994/historic-turnout.csv")

# Change first column name is Election
names(turnout_historic)[1] <- "Election"

# Amending data
turnout_historic <- turnout_historic %>%
  mutate(Election = as.numeric(Election),
         # NB 1978 included hundreds of thousands of duplicated names on the electoral roll.
         Electors = ifelse(Election == 1978, 2126594, Electors),
         # Subtracting the 361k names that were deleted in 1979-80 gives a turnout of 79.9%
         Turnout = ifelse(Election == 1978, 79.9, Turnout))

# reference: https://web.archive.org/web/20081017191904/http://www1.elections.org.nz/record/resultsdata/elections-dates-turnout.html

# Save to .rds
usethis::use_data(turnout_historic, overwrite = TRUE)