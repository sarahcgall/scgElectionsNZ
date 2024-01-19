# 2.1 Party votes and turnout by Electorate + 2.2 Electorate Candidate votes and turnout by Electorate
# 2.3 Party special declaration votes by Electorate + 2.4 Electorate Candidate special declaration votes by Electorate
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")

process_type_data <- function(year, file_type, skip_rows, special_vote = FALSE) {
  file_prefix <- ifelse(file_type == "party", "party", "candidate")
  file_suffix <- ifelse(special_vote, "-sdv-by-electorate", "-votes-and-turnout-by-electorate")

  tmp <- upload(year, paste0(file_prefix, file_suffix), skip_rows)
  tmp$Ballot <- ifelse(file_type == "party", "Party", "Candidate")

  if (special_vote == FALSE) {
    if (file_prefix == "candidate") {
      tmp <- tmp[, -14] # remove column that doesn't exist in party version
    }
    tmp <- tmp[-1, c(1, 2, 3, 5, 6, 8, 9, 15)] # Remove subtitle row and subset desired columns
  } else {
    tmp <- tmp[, c(1, 2, 3, 5, 6, 12)] # subset desired columns
  }

  tmp <- tmp %>%
    filter(str_detect(tmp[, 1], "Totals") == FALSE) %>%  # Exclude totals
    mutate(Election = as.numeric(year))  # Add and convert year column as numeric

  return(tmp)
}

process_and_bind_data <- function(years, file_type, skip_rows, special_vote = FALSE) {
  map_dfr(years, ~process_type_data(.x, file_type, skip_rows, special_vote)) %>%
    bind_rows(map_dfr(years, ~process_type_data(.x, "candidate", skip_rows, special_vote)))
}
# =====================================#
# Process and combine data for valid votes
validity <- process_and_bind_data(year, "party", 3) %>%
  rename(Electorate = Electoral.District) %>%
  pivot_longer(cols = c(Ordinary.Votes:Special.Votes.Disallowed),
               names_to = "Vote_Type", values_to = "Votes") %>%
  filter(!Vote_Type %in% c("Special.Votes", "Special.Votes.1")) %>% # remove to avoid duplication with special votes df
  mutate(Votes = as.numeric(Votes),
         Validity = case_when(
           Vote_Type %in% c("Ordinary.Votes") ~ "Valid",
           Vote_Type %in% c("Ordinary.Votes.1") ~ "Informal",
           Vote_Type %in% c("Ordinary.Votes.Disallowed", "Special.Votes.Disallowed") ~ "Disallowed"
         ),
         Vote_Type = case_when(
           Vote_Type %in% c("Ordinary.Votes", "Ordinary.Votes.1", "Ordinary.Votes.Disallowed") ~ "Ordinary",
           Vote_Type %in% c("Special.Votes.Disallowed") ~ "Special"
         )) %>%
  select(Election, Ballot, Electorate, Validity, Vote_Type, Votes)

# Process and combine data for specialvotes
special <- process_and_bind_data(year, "party", 3, TRUE) %>%
  pivot_longer(cols = c(NZ:Overseas.1), names_to = "Vote_Type", values_to = "Votes") %>%
  mutate(Votes = as.numeric(Votes),
         Validity = case_when(
           Vote_Type %in% c("NZ", "Overseas") ~ "Valid",
           Vote_Type %in% c("NZ.1", "Overseas.1") ~ "Informal"
         ),
         Vote_Type = case_when(
           Vote_Type %in% c("NZ", "NZ.1") ~ "Special - NZ",
           Vote_Type %in% c("Overseas", "Overseas.1") ~ "Special - Overseas"
         )) %>%
  select(Election, Ballot, Electorate, Validity, Vote_Type, Votes)

# Bind valid and special data frames
vote_type <- bind_rows(validity, special) %>%
  arrange(-Election, Ballot, Electorate, Validity, Vote_Type) %>% # re-index
  mutate(across(where(is.numeric), ~replace_na(., 0)))  # Replace NA with 0 for numeric columns

# Save to .rds
usethis::use_data(vote_type, overwrite = TRUE)