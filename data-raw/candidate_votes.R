# ABOUT
# This script combines and cleans all election results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 4.4 Percentage of Electorate Candidate Votes of successful registered parties
candidate_votes <- data.frame()
for (i in year) {
  df <- upload(i, "percentage-candidate-votes-for-registered-parties", 1)
  df <- df %>%
    filter(str_detect(df[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) # add year and convert to numeric

  df <- df[-1,] # delete first row
  df <- df %>%
    pivot_longer(cols=!c(Election,Electorate,Total.Valid.Votes),
                 names_to = "Party", values_to = "Votes") %>% # make party names within column "Party"
    filter(!str_detect(Party, "X"))

  candidate_votes <- rbind(candidate_votes,df)
}
# CLEAN
candidate_votes$Party <- str_replace_all(candidate_votes$Party, "\\.", " ") # replace full stop with space
candidate_votes <- amend_parties(candidate_votes, Party) # amend party names
candidate_votes <- candidate_votes %>%
  mutate(Votes = as.numeric(Votes), Percentage = round(as.numeric(Votes)/as.numeric(Total.Valid.Votes)*100,2),
         Ballot = "Candidate") %>%
  select(Election, Ballot, Electorate, Party, Votes, Percentage)
# Remove special characters
candidate_votes$Electorate <- iconv(candidate_votes$Electorate,from="UTF-8",to="ASCII//TRANSLIT")
# save to .rds
usethis::use_data(candidate_votes, overwrite = TRUE)
