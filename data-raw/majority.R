# ABOUT
# This script combines and cleans all election results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 4.3 Winning Electorate Candidate Votes
majority <- data.frame()
for (i in year) {
  df <- upload(i, "winning-electorate-candidates", 1) # upload raw data from each election folder
  df <- df %>%
    mutate(Election = as.numeric(i)) %>% # add election year column and convert to numeric
    rename(Electorate = Electoral.District, Candidate = Electorate.Candidate,
         Party_List = On.the.Party.List,
         Votes = Majority)

  majority <- rbind(majority,df)
}
turnout <- data.frame()
for (i in year) {
  df <- upload(i, "candidate-votes-and-turnout-by-electorate", 3)
  df <- df[-1,-14]

  df <- df[,c(1,4)]

  df <- df %>%
    filter(str_detect(df[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) %>% # add year column for elections and convert to numeric
    rename(Electorate = Electoral.District, Valid_Votes = Valid.Total..a...b.)

  turnout <- rbind(turnout,df)
}
majority <- full_join(majority, turnout, by = c("Election","Electorate"))
# CLEAN
majority <- amend_parties(majority, Party) # amend party names
majority <- majority %>%
  mutate(Percentage = round(Votes / as.numeric(Valid_Votes) * 100, 2)) %>% # Add margin % / margin of victory
  select(Election, Electorate, Party, Candidate, Votes, Percentage, Party_List)
# Remove special characters
for (i in c("Candidate","Electorate","Party")) {
  majority[,i] <- iconv(majority[,i],from="UTF-8",to="ASCII//TRANSLIT")
}
# save to .rds
usethis::use_data(majority, overwrite = TRUE)
