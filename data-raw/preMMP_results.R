# ABOUT
# This script cleans and saves pre-MMP results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 4.3 Winning Electorate Candidate Votes
preMMP_results <- read.csv("data-raw/pre-1994/1890-1993-results.csv") # upload raw data from each election folder

# CLEAN
names(preMMP_results)[1] <- "Election"
preMMP_results <- amend_parties(preMMP_results, Party) # amend party names
preMMP_results <- preMMP_results %>%
  mutate(Election = as.numeric(Election)) %>%
  select(Election, Party, Seats, Percentage)

# save to .rds
usethis::use_data(preMMP_results, overwrite = TRUE)