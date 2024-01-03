# ABOUT
# This script combines and cleans all election results (2005 - 2020 only)
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# Split function
get_split <- function(year){
  path <- paths(year, "split")
  split_tmp <- data.frame()
  for (i in path) {
    # upload each path in folder
    tmp <- read.csv(i, skip = 0, encoding = "UTF-8")

    # =====================================#
    # CLEAN
    if (year == 2005) {
      tmp <- tmp %>%
        filter(tmp[,1] != "")
    }
    # Amend names of electorate
    if (year > 2010){
      name <- gsub("^.{0,12}","",colnames(tmp)[1])
    } else {
      name <- gsub("^.{0,4}","",colnames(tmp)[1])
    }
    tmp <- tmp %>%
      # make data longer
      pivot_longer(cols=2:length(tmp), names_to="Electorate_Party", values_to="Votes") %>%
      rename(List_Party = 1) %>%
      # substitute . for space
      mutate(Election = year, Electorate = str_replace_all(name,"\\.", " ")) %>%
      select(Election, Electorate, List_Party:Votes)
    tmp$Electorate_Party <- str_replace_all(tmp$Electorate_Party,
                                            "\\.", " ")

    # =====================================#
    # Get total number of votes:
    if (year != 2005) {
      tmp <- tmp %>%
        group_by(Election, Electorate, List_Party) %>%
        # maintain original percentage and convert to votes
        # (NB the 2023 results do not add up to 100% and therefore
        # the votes column should be treated with caution
        mutate(Percentage = Votes,
               Votes = Votes / 100 * Votes[Electorate_Party == "Total Party Votes"]) %>%
        ungroup() %>%
        # filter out unnecessary rows
        filter(List_Party != "Total Party Votes and Percentages",
              !Electorate_Party %in% c("Total  ","Total Party Votes")) %>%
        # create new percentage
        select(Election, Electorate, List_Party, Electorate_Party, Votes, Percentage)
    } else {
      # (NB 2005 does not have the total number of votes variable)
      tmp <- tmp %>%
        filter(List_Party != "Overall Percentage",
              !Electorate_Party %in% c("Total  ","Total Party Votes")) %>%
        mutate(Percentage = Votes, Votes = NA)
    }

    # =====================================#
    # Remove candidate names from Electorate_Party column
    tmp$Electorate_Party <- sub("\\s+$", "",
                                tmp$Electorate_Party)
    tmp$Electorate_Party <- gsub(".*(\\s+\\s+)", "",
                                 tmp$Electorate_Party)
    # Amend party names
    tmp$Electorate_Party <- iconv(tmp$Electorate_Party,from="UTF-8",to="ASCII//TRANSLIT")
    tmp <- amend_parties(tmp, Electorate_Party)
    tmp$List_Party <- iconv(tmp$List_Party,from="UTF-8",to="ASCII//TRANSLIT")
    tmp <- amend_parties(tmp, List_Party)

    # =====================================#
    # ADD
    split_tmp <- rbind(split_tmp, tmp)
  }
  return(split_tmp)
}
# =====================================#
# 5.1b Individual Electorates
split_electorate <- data.frame()
for (i in c(2023, 2020, 2017, 2014, 2011, 2008, 2005)){
  tmp <- get_split(i)
  split_electorate <- rbind(split_electorate, tmp)
}

# save to .rds
usethis::use_data(split_electorate, overwrite = TRUE)
