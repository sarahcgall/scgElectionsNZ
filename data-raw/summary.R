# 1.1 Summary of overall results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

process_summary_data <- function(year) {
  upload(year, "overall-results-summary", 4) %>%
    mutate(Election = as.numeric(year))
}
# =====================================#
# Process and combine data for all years
summary <- map_dfr(year, process_summary_data)

# Clean and amend party names
summary <- amend_parties(summary, Parties.Grouped.)

# Process Candidate and Party ballot data
summary_candidate <- summary %>%
  mutate(Ballot = "Candidate") %>%
  select(Election, Parties.Grouped., Ballot, Seats.Won:No..Nominated, Registered, Successful) %>%
  rename(Party = Parties.Grouped., Seats = Seats.Won, Votes = Electorate.Vote..n., Percentage = Electorate.Vote....,
         Nominated = No..Nominated)

summary_party <- summary %>%
  mutate(Ballot = "Party") %>%
  select(Election, Ballot, Parties.Grouped., Seats.Allocated:No..on.Party.List, Registered, Successful) %>%
  rename(Party = Parties.Grouped., Seats = Seats.Allocated, Votes = Party.Vote..n.,
         Percentage = Party.Vote...., Nominated = No..on.Party.List)

# Combine Candidate and Party data
summary_combined <- rbind(summary_candidate, summary_party)

# Create Total Vote
summary_total <- summary_combined %>%
  mutate(Votes = ifelse(Ballot == "Candidate", 0, Votes), # Total Vote = Party Vote
         Percentage = ifelse(Ballot == "Candidate", 0, Percentage), # Total Vote = Party Vote
         Ballot = "Total") %>%
  group_by(Election, Ballot, Party, Registered, Successful) %>%
  summarise(Seats = sum(Seats), Votes = sum(Votes), Percentage = sum(Percentage), Nominated = sum(Nominated), .groups = "drop")

# Merge Combined and Total data
summary <- rbind(summary_combined, summary_total)
# save to .rds
usethis::use_data(summary, overwrite = TRUE)