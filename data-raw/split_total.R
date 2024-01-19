# 5.1b All Electorates (Split Voting)
# This script combines and cleans all election results (2005 - 2020 only)
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

process_split_votes <- function(years) {
  split_total <- map_dfr(years, function(year) {
    tmp <- upload(year, "split-votes-all", 0) %>%
      pivot_longer(cols = -1, names_to = "Electorate_Party", values_to = "Votes") %>% # pivot all columns except first
      rename(List_Party = 1) %>% # rename first column
      mutate(Election = as.numeric(year),
             Electorate_Party = str_replace_all(Electorate_Party, "\\.", " ")) %>% # replace full stop with space
      amend_parties(., Electorate_Party) %>% # amend party names
      amend_parties(., List_Party) %>% # amend party names
      group_by(Election, List_Party) %>%
      # Calculate Votes
      mutate(Percentage = Votes,
             Votes = Votes / 100 * Votes[Electorate_Party == "Total Party Votes"]) %>%
      ungroup() %>%
      filter(List_Party != "Total Party Votes and Percentages",
             !Electorate_Party %in% c("Total","Total Party Votes")) %>%
      select(Election, List_Party, Electorate_Party, Votes, Percentage)
    return(tmp)
  })

  return(split_total)
}
# =====================================#
# Execute processing for specified years
years <- c("2023", "2020", "2017", "2014", "2011", "2008", "2005")
split_total <- process_split_votes(years)

# Save to .rds
usethis::use_data(split_total, overwrite = TRUE)