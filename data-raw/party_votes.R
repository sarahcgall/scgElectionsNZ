# ABOUT
# This script combines and cleans all election results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 4.1 Votes for Registered Parties by Electorate
party_votes <- data.frame()
for (i in year) {
  tmp <- upload(i, "votes-for-registered-parties-by-electorate", 2)
  tmp <- tmp %>%
    filter(str_detect(tmp[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) %>% # add year and convert to numeric
    pivot_longer(cols=!c(Election,Electorate,Total.Valid.Party.Votes,Informal.Party.Votes),
                 names_to = "Party", values_to = "Votes") # make party names within column "Party"

  party_votes <- rbind(party_votes,tmp)
}
# CLEAN
party_votes$Party <- str_replace_all(party_votes$Party, "\\.", " ") # replace full stop with space
party_votes <- amend_parties(party_votes, Party) # amend party names
party_votes1 <- party_votes %>%
  select(Election, Electorate, Party, Informal.Party.Votes) %>%
  mutate(Party = "Informal", Ballot = "Party") %>%
  rename(Votes = Informal.Party.Votes) %>%
  unique()
party_votes <- party_votes %>%
  mutate(Ballot = "Party") %>%
  select(Election, Ballot, Electorate, Party, Votes)
party_votes <- rbind(party_votes, party_votes1)
# Re-index
party_votes <- party_votes[
  with(party_votes, order(-Election, Ballot, Electorate, Party)),
]
# Remove special characters
party_votes$Electorate <- iconv(party_votes$Electorate,from="UTF-8",to="ASCII//TRANSLIT")
# save to .rds
usethis::use_data(party_votes, overwrite = TRUE)
