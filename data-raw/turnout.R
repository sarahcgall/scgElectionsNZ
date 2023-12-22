# ABOUT
# This script combines and cleans all election results
# NB original datafiles for pre-2005 (inclusive) have been amended with the addition of an
# "Ordinary Votes Disallowed" column which has been added to match post-2005 data files.
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 2.1 Party votes and turnout by Electorate + 2.2 Electorate Candidate votes and turnout by Electorate
turnout <- data.frame()
for (i in year) {
  tmp <- upload(i, "party-votes-and-turnout-by-electorate", 3)
  tmp <- tmp[-1,]
  tmp$Ballot <- "Party"

  tmp1 <- upload(i, "candidate-votes-and-turnout-by-electorate", 3)
  tmp1 <- tmp1[-1,-14]
  tmp1$Ballot <- "Candidate"

  tmp <- rbind(tmp, tmp1)
  tmp <- tmp[,c(1,7,10:15)]

  tmp <- tmp %>%
    filter(str_detect(tmp[,1],"Totals") == FALSE) %>%
    mutate(Election = as.numeric(i)) # add year column for elections and convert to numeric

  turnout <- rbind(turnout,tmp)
}

# CLEAN
# rename columns and create Ballot column
turnout <- turnout %>%
  rename(Electorate = Electoral.District, Total = Total.Votes.Cast..c...f...g...h., Electors = Electors.on.Master.Roll,
         Turnout = Votes.Cast.to.Electors.on.Master.Roll, Informal = Informal.Total..d...e.) %>%
  mutate(Total = as.numeric(Total), Electors = as.numeric(Electors), Turnout = round(as.numeric(Turnout), 2),
         Informal = as.numeric(Informal)) %>%
  select(Election, Ballot, Electorate, Electors, Turnout, Total, Informal)

# Remove special characters
turnout$Electorate <- iconv(turnout$Electorate,from="UTF-8",to="ASCII//TRANSLIT")

# save to .rds
usethis::use_data(turnout, overwrite = TRUE)