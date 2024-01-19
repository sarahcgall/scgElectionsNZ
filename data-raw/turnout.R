# 2.1 Party votes and turnout by Electorate + 2.2 Electorate Candidate votes and turnout by Electorate
# NB original datafiles for pre-2005 (inclusive) have been amended with the addition of an
# "Ordinary Votes Disallowed" column which has been added to match post-2005 data files.
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

process_turnout_data <- function(year, file_type) {
  tmp <- upload(year, file_type, 3) %>%
    slice(-1) %>%
    mutate(Ballot = ifelse(file_type == "party-votes-and-turnout-by-electorate",
                           "Party", "Candidate")) %>% # create Ballot column
    filter(!str_detect(Electoral.District, "Totals")) %>%
    mutate(Election = as.numeric(year)) %>%
    select(Election, Ballot, Electoral.District, Total.Votes.Cast..c...f...g...h.,
           Electors.on.Master.Roll, Votes.Cast.to.Electors.on.Master.Roll, Informal.Total..d...e.)

  return(tmp)
}
# =====================================#
# Process and combine data for all years and both file types
turnout <- map_dfr(year, ~process_turnout_data(.x, "party-votes-and-turnout-by-electorate")) %>%
  bind_rows(map_dfr(year, ~process_turnout_data(.x, "candidate-votes-and-turnout-by-electorate")))

# Rename columns and make numeric
turnout <- turnout %>%
  rename(Electorate = Electoral.District,
         Total = Total.Votes.Cast..c...f...g...h.,
         Electors = Electors.on.Master.Roll,
         Turnout = Votes.Cast.to.Electors.on.Master.Roll,
         Informal = Informal.Total..d...e.) %>%
  mutate(Total = as.numeric(Total),
         Electors = as.numeric(Electors),
         Turnout = round(as.numeric(Turnout), 2),
         Informal = as.numeric(Informal)) %>%
  select(Election, Ballot, Electorate, Electors, Turnout, Total, Informal)

# save to .rds
usethis::use_data(turnout, overwrite = TRUE)