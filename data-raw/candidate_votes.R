# 4.4 Percentage of Electorate Candidate Votes of successful registered parties
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

# Function to upload all candidate_votes csvs for each election year and clean
process_candidate_data <- function(year) {
  tmp <- upload(year, "percentage-candidate-votes-for-registered-parties", 1) %>%
    filter(!str_detect(Electorate, "Totals")) %>% # Remove "Totals" from dataset
    mutate(Election = as.numeric(year)) %>% # Add year and convert to numeric
    slice(-1) %>% # Delete first row
    pivot_longer(cols = -c(Election, Electorate, Total.Valid.Votes), # Make party names within column "Party"
                 names_to = "Party", values_to = "Votes") %>%
    filter(!str_detect(Party, "X")) %>% # remove percentage figure
    mutate(Party = str_replace_all(Party, "\\.", " "), # Replace full stop with space
           Votes = as.numeric(Votes),
           Percentage = round(Votes / as.numeric(Total.Valid.Votes) * 100, 2),
           Ballot = "Candidate")

  return(tmp)
}

# =====================================#
# GET DATA
candidate_votes <- map_dfr(year, process_candidate_data)

# Amend party names
candidate_votes <- amend_parties(candidate_votes, Party) %>%
  select(Election, Ballot, Electorate, Party, Votes, Percentage)

# Save to .rds
usethis::use_data(candidate_votes, overwrite = TRUE)