# ABOUT
# This script combines and cleans all election results (2005 - 2020 only)
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 5.1b All Electorates
split_total <- data.frame()
for (i in c("2023", "2020", "2017", "2014", "2011", "2008", "2005")) {
  tmp <- upload(i, "split-votes-all", 0)
  tmp <- tmp %>%
    pivot_longer(cols=2:length(tmp), names_to="Electorate_Party",values_to="Votes") %>%
    rename(List_Party = 1) %>%
    mutate(Election = as.numeric(i))

  split_total <- rbind(split_total, tmp)
}
# CLEAN
split_total$Electorate_Party <- str_replace_all(split_total$Electorate_Party, "\\.", " ") # replace full stop with space

split_total <- amend_parties(split_total, Electorate_Party) # amend party names
split_total <- amend_parties(split_total, List_Party) # amend party names

split_total <- split_total %>%
  group_by(Election, List_Party) %>%
  mutate(Votes = Votes / 100 * Votes[Electorate_Party == "Total Party Votes"]) %>%
  ungroup() %>%
  filter(List_Party != "Total Party Votes and Percentages",
         !Electorate_Party %in% c("Total  ","Total Party Votes")) %>%
  group_by(Election, List_Party, Electorate_Party) %>%
  summarise(Votes = sum(Votes)) %>%
  ungroup() %>%
  group_by(Election, List_Party) %>%
  mutate(Percentage = Votes / sum(Votes) * 100) %>%
  ungroup()
# Remove special characters
split_total$Electorate_Party <- iconv(split_total$Electorate_Party,from="UTF-8",to="ASCII//TRANSLIT")
split_total$List_Party <- iconv(split_total$List_Party,from="UTF-8",to="ASCII//TRANSLIT")
# save to .rds
usethis::use_data(split_total, overwrite = TRUE)