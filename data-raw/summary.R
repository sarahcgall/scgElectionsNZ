# ABOUT
# This script combines and cleans all election results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 1.1 Summary of overall results
summary <- data.frame()
for (i in year) {
  tmp <- upload(i, "overall-results-summary", 4)
  tmp <- tmp %>%
    mutate(Election = as.numeric(i)) # add year column for elections and convert to numeric

  summary <- rbind(summary,tmp)
}
# CLEAN
summary <- amend_parties(summary, Parties.Grouped.) # amend party names
# rename columns and create Ballot column
summary1 <- summary %>%
  mutate(Ballot = "Candidate") %>%
  select(Election, Parties.Grouped., Ballot, Seats.Won:No..Nominated, Registered, Successful) %>%
  rename(Party = Parties.Grouped., Seats = Seats.Won, Votes = Electorate.Vote..n., Percentage = Electorate.Vote....,
         Nominated = No..Nominated)
summary <- summary %>%
  mutate(Ballot = "Party") %>%
  select(Election, Ballot, Parties.Grouped., Seats.Allocated:No..on.Party.List, Registered, Successful) %>%
  rename(Party = Parties.Grouped., Seats = Seats.Allocated, Votes = Party.Vote..n.,
         Percentage = Party.Vote...., Nominated = No..on.Party.List)
# Merge
summary <- rbind(summary, summary1)

# Create total
summary1 <- summary %>%
  mutate(Votes = ifelse(Ballot == "Candidate", 0, Votes), # Total Vote = Party Vote
         Percentage = ifelse(Ballot == "Candidate", 0, Percentage), # Total Vote = Party Vote
         Ballot = "Total") %>%
  group_by(Election, Ballot,  Party, Registered, Successful) %>%
  summarise(Seats = sum(Seats), Votes = sum(Votes), Percentage = sum(Percentage), Nominated = sum(Nominated)) %>%
  ungroup()
# Merge
summary <- rbind(summary, summary1)
summary$Party <- iconv(summary$Party,from="UTF-8",to="ASCII//TRANSLIT")

# save to .rds
usethis::use_data(summary, overwrite = TRUE)