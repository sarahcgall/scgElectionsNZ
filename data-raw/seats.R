# ABOUT
# This script combines and cleans all election results
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# 3.2 Actual Quotients for Party List Seat Allocation
# The following produces the Number of Party Votes, Percentage, Electorate Seats, List Seats, and Total Seats for
# eligible parties for elections between 1996 and 2020, inclusively.
seats <- data.frame()
for (i in year) { # loop through election years
  df <- upload(i, "party-quotients", 2) # upload csv files, remove the first two rows (header @ row 3)
  df <- df %>%
    filter(df[,1] %in% c("Number of Party Votes","Percentage","Electorate Seats","List Seats","Total seats")) %>% # select relevant rows
    select(-contains("Seat.No.")) # remove columns with "Seat.No." in the heading
  df <- df %>%
    pivot_longer(cols=!Divisor, names_to = "Party", values_to = "Seats") %>% # make party names within column "Party"
    mutate(Election = as.numeric(i)) %>% # add year column for elections
    pivot_wider(names_from = Divisor, values_from = Seats) # make Divisor rows column names

  seats <- rbind(seats, df) # add rows to one file
}
# CLEAN
seats$Party <- str_replace_all(seats$Party, "\\.", " ") # replace full stop with space
seats <- amend_parties(seats, Party) # amend party names
# rename
seats <- seats %>%
  rename(Party_Vote = `Number of Party Votes`, Party_Perc = `Percentage`,
         Electorate_Seats = `Electorate Seats`, List_Seats = `List Seats`,
         Seats = `Total seats`) %>%
  select(Election, Party:Seats)
# save to .rds
usethis::use_data(seats, overwrite = TRUE)