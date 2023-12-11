# ABOUT
# This script combines and cleans all election results
# NB original datafiles for pre-2005 (inclusive) have been amended with the addition of an
# "Ordinary Votes Disallowed" column which has been added to match post-2005 data files.
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 2.1 Party votes and turnout by Electorate + 2.2 Electorate Candidate votes and turnout by Electorate
validity <- data.frame()
for (i in year) {
  df <- upload(i, "party-votes-and-turnout-by-electorate", 3)
  df <- df[-1,]
  df$Ballot <- "Party"

  df1 <- upload(i, "candidate-votes-and-turnout-by-electorate", 3)
  df1 <- df1[-1,-14]
  df1$Ballot <- "Candidate"

  df <- rbind(df, df1)
  df <- df[,c(1,2,3,5,6,8,9,15)]

  df <- df %>%
    filter(str_detect(df[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) # add year column for elections and convert to numeric

  validity <- rbind(validity,df)
}

# CLEAN
# rename columns and create Ballot column
validity <- validity %>%
  rename(Electorate = Electoral.District) %>%
  pivot_longer(cols=c(Ordinary.Votes:Special.Votes.Disallowed), names_to="Vote_Type", values_to="Votes") %>%
  filter(!Vote_Type %in% c("Special.Votes","Special.Votes.1")) %>% # remove to avoid duplication with special votes df
  mutate(Votes = as.numeric(Votes),
         Validity = case_when(
    Vote_Type %in% c("Ordinary.Votes") ~ "Valid",
    Vote_Type %in% c("Ordinary.Votes.1") ~ "Informal",
    Vote_Type %in% c("Ordinary.Votes.Disallowed","Special.Votes.Disallowed") ~ "Disallowed"
  )) %>%
  mutate(Vote_Type = case_when(
    Vote_Type %in% c("Ordinary.Votes","Ordinary.Votes.1","Ordinary.Votes.Disallowed") ~ "Ordinary",
    Vote_Type %in% c("Special.Votes.Disallowed") ~ "Special"
  )) %>%
  select(Election, Ballot, Electorate, Validity, Vote_Type, Votes)

# Remove special characters
validity$Electorate <- iconv(validity$Electorate,from="UTF-8",to="ASCII//TRANSLIT")

# 2.3 Party special declaration votes by Electorate + 2.4 Electorate Candidate special declaration votes by Electorate
special <- data.frame()
for (i in year) {
  df <- upload(i, "party-sdv-by-electorate", 3)
  df$Ballot <- "Party"

  df1 <- upload(i, "candidate-sdv-by-electorate", 3)
  df1$Ballot <- "Candidate"

  df <- rbind(df, df1)
  df <- df[,c(1,2,3,5,6,12)]

  df <- df %>%
    filter(str_detect(df[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) # add year column for elections and convert to numeric

  special <- rbind(special,df)
}

# rename columns and create Ballot column
special <- special %>%
  pivot_longer(cols=c(NZ:Overseas.1), names_to="Vote_Type", values_to="Votes") %>%
  mutate(Votes = as.numeric(Votes),
         Validity = case_when(
    Vote_Type %in% c("NZ","Overseas") ~ "Valid",
    Vote_Type %in% c("NZ.1","Overseas.1") ~ "Informal"
  )) %>%
  mutate(Vote_Type = case_when(
    Vote_Type %in% c("NZ","NZ.1") ~ "Special - NZ",
    Vote_Type %in% c("Overseas","Overseas.1") ~ "Special - Overseas"
  )) %>%
  select(Election, Ballot, Electorate, Validity, Vote_Type, Votes)

# Remove special characters
special$Electorate <- iconv(special$Electorate,from="UTF-8",to="ASCII//TRANSLIT")

# Merge the two dfs together
vote_type <- rbind(validity, special)
# Re-index
vote_type <- vote_type[
  with(vote_type, order(-Election, Ballot, Electorate, Validity, Vote_Type)),
]
vote_type[is.na(vote_type)] <- 0
# save to .rds
usethis::use_data(vote_type, overwrite = TRUE)