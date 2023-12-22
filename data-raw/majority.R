# ABOUT
# This script combines and cleans all election results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 4.3 Winning Electorate Candidate Votes
majority <- data.frame()
for (i in year) {
  tmp <- upload(i, "winning-electorate-candidates", 1) # upload raw data from each election folder
  tmp <- tmp %>%
    mutate(Election = as.numeric(i)) %>% # add election year column and convert to numeric
    rename(Electorate = Electoral.District, Candidate = Electorate.Candidate,
         Party_List = On.the.Party.List,
         Votes = Majority)

  majority <- rbind(majority,tmp)
}
turnout <- data.frame()
for (i in year) {
  tmp <- upload(i, "candidate-votes-and-turnout-by-electorate", 3)
  tmp <- tmp[-1,-14]

  tmp <- tmp[,c(1,4)]

  tmp <- tmp %>%
    filter(str_detect(tmp[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) %>% # add year column for elections and convert to numeric
    rename(Electorate = Electoral.District, Valid_Votes = Valid.Total..a...b.)

  turnout <- rbind(turnout,tmp)
}
majority <- full_join(majority, turnout, by = c("Election","Electorate"))
# CLEAN
majority <- amend_parties(majority, Party) # amend party names
majority <- majority %>%
  mutate(Percentage = round(Votes / as.numeric(Valid_Votes) * 100, 2), # Add margin % / margin of victory
         Party_List = ifelse(Party_List == "yes", "Yes",
                      ifelse(Party_List == "no", "No",
                             Party_List))) %>% # amend inconsisties within raw data
  select(Election, Electorate, Party, Candidate, Votes, Percentage, Party_List)
# Remove special characters
for (i in c("Candidate","Electorate","Party")) {
  majority[,i] <- iconv(majority[,i],from="UTF-8",to="ASCII//TRANSLIT")
}
# save to .rds
usethis::use_data(majority, overwrite = TRUE)
