# 4.1 Votes for Registered Parties by Electorate
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

process_party_votes <- function(year) {
  tmp <- upload(year, "votes-for-registered-parties-by-electorate", 2) %>%
    filter(!str_detect(Electorate, "Totals")) %>%
    mutate(Election = as.numeric(year)) %>% # add year and convert to numeric
    pivot_longer(cols = !c(Election, Electorate, Total.Valid.Party.Votes, Informal.Party.Votes),
                 names_to = "Party", values_to = "Votes") %>% # make party names within column "Party"
    mutate(Party = str_replace_all(Party, "\\.", " ")) # replace full stop with space

  return(tmp)
}
# =====================================#
# Process and combine data for all years
party_votes <- map_dfr(year, process_party_votes)

# Amend party names
party_votes <- amend_parties(party_votes, Party)

# Process Informal Votes
party_votes_informal <- party_votes %>%
  select(Election, Electorate, Informal.Party.Votes) %>%
  mutate(Party = "Informal", Ballot = "Party", Votes = Informal.Party.Votes) %>%
  unique() %>%
  select(Election, Ballot, Electorate, Party, Votes)

# Combine and Select Columns
party_votes <- party_votes %>%
  mutate(Ballot = "Party") %>%
  select(Election, Ballot, Electorate, Party, Votes)

# Re-index with informals
party_votes <- rbind(party_votes, party_votes_informal) %>%
  arrange(-Election, Ballot, Electorate, Party)

# Save to .rds
usethis::use_data(party_votes, overwrite = TRUE)