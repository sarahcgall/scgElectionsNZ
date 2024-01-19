# 4.3 Winning Electorate Candidate Votes
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

process_majority_data <- function(year) {
  upload(year, "winning-electorate-candidates", 1) %>% # upload raw data from each election folder
    mutate(Election = as.numeric(year)) %>% # add election year column and convert to numeric
    rename(Electorate = Electoral.District, Candidate = Electorate.Candidate,
           Party_List = On.the.Party.List, Votes = Majority)
}

process_turnout_data <- function(year) {
  upload(year, "candidate-votes-and-turnout-by-electorate", 3) %>%
    slice(-1) %>% # remove 1st row containing subheader
    filter(!str_detect(Electoral.District, "Totals")) %>%
    mutate(Election = as.numeric(year), # add year column for elections and convert to numeric
           Electorate = Electoral.District,
           Valid_Votes = Valid.Total..a...b.) %>%
    select(Election, Electorate, Valid_Votes)
}
# =====================================#
# Process and combine data for all years
majority <- map_dfr(year, process_majority_data)
turnout <- map_dfr(year, process_turnout_data)

# Joining data frames
majority <- full_join(majority, turnout, by = c("Election", "Electorate"))

# Data cleaning and transformation
majority <- majority %>%
  amend_parties(Party) %>%
  mutate(Percentage = round(Votes / as.numeric(Valid_Votes) * 100, 2),
         Party_List = case_when(
           Party_List == "yes" ~ "Yes",
           Party_List == "no" ~ "No",
           TRUE ~ Party_List
         )) %>%
  select(Election, Electorate, Party, Candidate, Votes, Percentage, Party_List)

# Save to .rds
usethis::use_data(majority, overwrite = TRUE)